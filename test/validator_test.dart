import 'package:flutter_test/flutter_test.dart';
import 'package:maldives_plate/maldives_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(PlateSpec spec, String value) =>
      const MaldivesPlateValidator().validate(PlateEntry(spec: spec, values: value.split(' ')));

  test('accepts the article examples', () {
    expect(judge(MaldivesPlates.private, 'A B 1 A 3665').isValid, isTrue);
    expect(judge(MaldivesPlates.taxi, 'A A 0 A 1234').isValid, isTrue);
    final police = MaldivesPlates.police;
    expect(judge(police, 'C C 2 D 12').isValid, isTrue);
  });

  test('rejects a category code the article does not list', () {
    expect(judge(MaldivesPlates.private, 'A B 3 A 3665').isValid, isFalse);
    expect(judge(MaldivesPlates.private, 'A D 1 A 3665').isValid, isFalse);
  });

  test('the serial is one slot of one to four digits', () {
    final spec = MaldivesPlates.private;
    expect(spec.slotCount, 5);
    expect(spec.slots.last.length, 4);
    expect(spec.slots.last.minLength, 1);
    expect(identical(MaldivesPlates.private, MaldivesPlates.private), isTrue);
  });

  test('categories are distinguished by their letter', () {
    expect(
      MaldivesCategory.values.map((c) => c.letter).toSet().length,
      MaldivesCategory.values.length,
    );
  });
}
