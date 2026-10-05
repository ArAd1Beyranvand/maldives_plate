import 'package:plate_core/plate_core.dart';

import 'maldives_colors.dart';

/// The Maldives as a `PlateCountry`. The plate carries no flag or country
/// block, so every spec sets `noPanel`.
abstract final class MaldivesCountry {
  static const PlateCountry maldives = PlateCountry(
    code: 'mv',
    captionLines: <String>[],
    panelColor: MaldivesColors.white,
    panelTextColor: MaldivesColors.black,
  );
}
