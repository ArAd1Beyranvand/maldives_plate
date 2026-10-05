import 'package:flutter_test/flutter_test.dart';
import 'package:maldives_plate/maldives_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(PlateSpec spec, String value) =>
      const MaldivesPlateValidator().validate(
        PlateEntry(spec: spec, values: value.split('')),
      );

  test('accepts the article examples', () {
    expect(judge(MaldivesPlates.private, 'AB1A3665').isValid, isTrue);
    expect(judge(MaldivesPlates.taxi, 'AA0A1234').isValid, isTrue);
    final police = MaldivesPlates.of(MaldivesCategory.police, serialDigits: 2);
    expect(judge(police, 'CC2D12').isValid, isTrue);
  });

  test('rejects a category code the article does not list', () {
    expect(judge(MaldivesPlates.private, 'AB3A3665').isValid, isFalse);
    expect(judge(MaldivesPlates.private, 'AD1A3665').isValid, isFalse);
  });

  test('slot counts follow the serial digits', () {
    final taxi = MaldivesPlates.of(MaldivesCategory.taxi, serialDigits: 2);
    expect(MaldivesPlates.private.slotCount, 8);
    expect(taxi.slotCount, 6);
    expect(identical(MaldivesPlates.private, MaldivesPlates.private), isTrue);
    expect(
      () => MaldivesPlates.of(MaldivesCategory.taxi, serialDigits: 5),
      throwsArgumentError,
    );
  });

  test('categories are distinguished by their letter', () {
    expect(
      MaldivesCategory.values.map((c) => c.letter).toSet().length,
      MaldivesCategory.values.length,
    );
  });
}
