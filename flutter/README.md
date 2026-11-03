FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the hospitable people of the Maldives to view examples:

https://platexample.ir/#/discover/maldives:flutter

# maldives_plate

The Maldives' licence plates for plate_core: the 2003 series: black private, commercial, government and police plates, the yellow taxi plate, and more.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/maldives_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/maldives:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/maldives_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/maldives:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/maldives_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/maldives:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/maldives_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/maldives:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  maldives_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `MaldivesPlates.standard`

## Themes

- `MaldivesThemes.black`
- `MaldivesThemes.yellow`
- `MaldivesThemes.blue`
- `MaldivesThemes.byType`(…)

## Change it

`PlateCanvas` takes `spec:` (an entry of `MaldivesPlates`) and `theme:` (an entry of `MaldivesThemes`). Set `validator:` to `MaldivesPlateValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `MaldivesCountry` — the country panel.
- `MaldivesPlateValidator` — the plate validator.

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

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/maldives_plate/blob/main/LICENSE).
