/// The Maldives' licence plates for the `plate_core` library.
///
/// The 2003 series (461×273, the reference artwork's own size): black
/// private, commercial, government and police plates, the yellow taxi plate
/// and the blue diplomatic plate. Earlier series are not implemented.
library;

// TODO(py): [D5] one module `plates.countries.maldives`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/maldives`; tree-shakable.
// TODO(kt): [D5] package `countries.maldives` in the countries module.
export 'src/maldives_alphabets.dart';
export 'src/maldives_colors.dart';
export 'src/maldives_country.dart';
export 'src/maldives_plates.dart';
export 'src/maldives_themes.dart';
export 'src/maldives_validators.dart';
