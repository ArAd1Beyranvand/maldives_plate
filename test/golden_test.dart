import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maldives_plate/maldives_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per category, rendered with a real face and filled with the
/// reference artwork's own `A B1 A / 3665` so the ink can be measured.
void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final loader = FontLoader('Roboto');
    for (final path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  final themes = <MaldivesCategory, PlateTheme>{
    MaldivesCategory.private: MaldivesThemes.black,
    MaldivesCategory.commercial: MaldivesThemes.black,
    MaldivesCategory.government: MaldivesThemes.black,
    MaldivesCategory.police: MaldivesThemes.black,
    MaldivesCategory.taxi: MaldivesThemes.yellow,
    MaldivesCategory.diplomatic: MaldivesThemes.blue,
  };

  test('every category has a spec and a theme', () {
    expect(<PlateSpec>[
      for (final c in MaldivesCategory.values) MaldivesPlates.of(c),
    ], MaldivesPlates.all);
    expect(themes.keys.toSet(), MaldivesCategory.values.toSet());
  });

  for (final c in MaldivesCategory.values) {
    testWidgets(c.id, (tester) async {
      final spec = MaldivesPlates.of(c);
      final controller = PlateController.fromValues(
        spec,
        'A B 1 A 3665'.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            backgroundColor: const Color(0xFF808080),
            body: Center(
              child: SizedBox(
                width: 922,
                height: 922 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(
                  controller: controller,
                  theme: themes[c]!,
                  country: MaldivesCountry.maldives,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/${c.id}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
