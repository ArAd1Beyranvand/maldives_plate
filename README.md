FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the hospitable people of the Maldives to view examples:

https://platexample.ir/#/discover/maldives

# maldives_plate

The Maldives' licence plates for the `plate_core` library. The 2003 series (461×273, the reference artwork's own size): black private, commercial, government and police plates, the yellow taxi plate and the blue diplomatic plate. Earlier series are not implemented.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  maldives_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:maldives_plate/maldives_plate.dart';

PlateCanvas(
  spec: MaldivesPlates.standard,
  theme: MaldivesThemes.black,
  validator: const MaldivesPlateValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `MaldivesCountry` — country panel: `maldives`.
- `MaldivesPlates` — 1 plate spec: `standard`.
- `MaldivesThemes` — 3 themes: `black`, `yellow`, `blue`.
- `MaldivesPlateValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

One design, six categories.

The top row is a letter, a two-character vehicle category code (`B1`) and a
letter; the bottom row the serial of up to four digits, after the category's
type letter. Values are `[first, category letter, category digit, last,
serial, type]`; the type (`P`, `C`, `G`, `S`, `T`, `D`) is a chosen slot and
`MaldivesThemes.byType` picks the taxi and diplomatic liveries. Text groups:
`first`, `category`, `last`, `serial`, `type`.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

