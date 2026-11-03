FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the hospitable people of the Maldives to view examples:

https://platexample.ir/#/discover/maldives:typescript

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

### Install (TypeScript)

Copy `typescript/src/countries/maldives/` into `plate_core/typescript/src/countries/`.

Then run the tests from `plate_core/typescript/`: `npm test`.

### Use

```ts
import country from './countries/maldives';

const spec = country.specs.get('mv.standard');
console.log(country.package);
```

## Specs

The specs are the same in every language (they come from shared data).

- `mv.standard`

## Themes

- `MaldivesThemes.black`
- `MaldivesThemes.yellow`
- `MaldivesThemes.blue`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`MaldivesPlateValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/maldives_plate/blob/main/LICENSE).
