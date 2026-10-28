import 'package:plate_core/plate_core.dart';

/// Advisory validator for any `MaldivesPlates` value: the category code is
/// one of the eight published and the serial is 1-4 digits.
class MaldivesPlateValidator extends GatedPlateValidator {
  const MaldivesPlateValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonCategory =
      'Not a vehicle category code in the published table.';
  static const String reasonSerial = 'The serial is 1–4 digits.';

  /// Motorcycles, passenger and goods.
  static const Set<String> categories = <String>{
    'A0', 'A1', 'B0', 'B1', 'B2', 'C0', 'C1', 'C2', //
  };

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!categories.contains(entry.group('category'))) {
      return const PlateValidation.invalid(reasonCategory);
    }
    final s = entry.group('serial');
    if (!isDigits(s) || s.length > 4) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
