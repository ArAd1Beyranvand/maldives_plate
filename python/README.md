FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the hospitable people of the Maldives to view examples:

https://platexample.ir/#/discover/maldives:python

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

### Install (Python)

Copy `python/plates/countries/maldives/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.maldives.data import SPECS, THEMES

spec = SPECS["mv.standard"]
theme = THEMES["MaldivesThemes.black"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `mv.standard`

## Themes

- `MaldivesThemes.black`
- `MaldivesThemes.yellow`
- `MaldivesThemes.blue`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `MaldivesPlateValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/maldives_plate/blob/main/LICENSE).
