import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'maldives_colors.dart';

/// One ink on one field. The frame floats inside the plate edge, so each spec
/// paints it in the background and the theme's border is zero.
abstract final class MaldivesThemes {
  static final PlateTheme black = _ink(MaldivesColors.black, MaldivesColors.white);

  static final PlateTheme yellow = _ink(MaldivesColors.yellow, MaldivesColors.black);

  static final PlateTheme blue = _ink(MaldivesColors.blue, MaldivesColors.white);
}

PlateTheme _ink(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: MaldivesColors.inactive,
  borderWidthRatio: 0,
  plateRadiusRatio: 0,
);
