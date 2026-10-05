import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'maldives_colors.dart';

/// One ink on one field. The frame is not the theme's: the artwork's white
/// line floats 14–17 units inside the plate edge, so each spec paints it in
/// the background and sets the theme's border to nothing.
abstract final class MaldivesThemes {
  /// Private, commercial, government and police plates.
  static final PlateTheme black = _ink(
    MaldivesColors.black,
    MaldivesColors.white,
  );

  /// Taxi plates.
  static final PlateTheme yellow = _ink(
    MaldivesColors.yellow,
    MaldivesColors.black,
  );

  /// Diplomatic plates.
  static final PlateTheme blue = _ink(
    MaldivesColors.blue,
    MaldivesColors.white,
  );
}

PlateTheme _ink(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: MaldivesColors.inactive,
  borderWidthRatio: 0,
  plateRadiusRatio: 0,
);
