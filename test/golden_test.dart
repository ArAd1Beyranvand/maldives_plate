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
    for (final path in const <String>['/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf']) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  const samples = <String, String>{
    'private': 'A B 1 A 3665 P',
    'taxi': 'A A 0 A 1234 T',
    'diplomatic': 'A A 0 A 1234 D',
  };

  for (final e in samples.entries) {
    testWidgets(e.key, (tester) async {
      final spec = MaldivesPlates.standard;
      final controller = PlateController.fromValues(spec, e.value.split(' '));
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
                  theme: MaldivesThemes.black,
                  country: MaldivesCountry.maldives,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/${e.key}.png'));
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
