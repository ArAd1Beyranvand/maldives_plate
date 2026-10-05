import 'package:flutter/widgets.dart';

/// The colours of the 2003 Maldivian plates, sampled as the modal colour of
/// each region of the article's artwork (`Maldives_privat_plate_graphic`,
/// `…_taxi_…`, `…_diplomatic_…`).
abstract final class MaldivesColors {
  /// The black plates' field and the taxi plate's ink. Sampled `000000`.
  static const Color black = Color(0xFF000000);

  /// The ink and frame of the black and blue plates. Sampled `FFFFFF`.
  static const Color white = Color(0xFFFFFFFF);

  /// The taxi field, `FEF200`: a saturated lemon.
  static const Color yellow = Color(0xFFFEF200);

  /// The diplomatic field, `00A3E8`: a sky blue.
  static const Color blue = Color(0xFF00A3E8);

  static const Color inactive = Color(0xFFB0B0B0);
}
