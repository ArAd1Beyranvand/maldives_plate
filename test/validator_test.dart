import 'package:flutter_test/flutter_test.dart';
import 'package:maldives_plate/maldives_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(PlateSpec spec, String value) =>
      const MaldivesPlateValidator().validate(PlateEntry(spec: spec, values: value.split(' ')));

  test('accepts the article examples', () {
    expect(judge(MaldivesPlates.standard, 'A B 1 A 3665 P').isValid, isTrue);
    expect(judge(MaldivesPlates.standard, 'A A 0 A 1234').isValid, isTrue);
    expect(judge(MaldivesPlates.standard, 'C C 2 D 12').isValid, isTrue);
  });

  test('rejects a category code the article does not list', () {
    expect(judge(MaldivesPlates.standard, 'A B 3 A 3665').isValid, isFalse);
    expect(judge(MaldivesPlates.standard, 'A D 1 A 3665').isValid, isFalse);
  });

  test('the serial is one slot of one to four digits', () {
    final spec = MaldivesPlates.standard;
    expect(spec.slotCount, 6);
    expect(spec.slots[4].length, 4);
    expect(spec.slots[4].minLength, 1);
  });
}
