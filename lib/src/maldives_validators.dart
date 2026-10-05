import 'package:plate_core/plate_core.dart';

/// Judges any `MaldivesPlates` value. Reports, never bars a keystroke.
///
/// Checks what the article states: the category code is one of the eight it
/// lists (A0, A1, B0, B1, B2, C0, C1, C2) and the serial is 1–4 digits.
class MaldivesPlateValidator extends GatedPlateValidator {
  const MaldivesPlateValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonCategory =
      'Not a vehicle category code in the published table.';
  static const String reasonSerial = 'The serial is 1–4 digits.';

  /// The article's vehicle categories: motorcycles, passenger and goods.
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
