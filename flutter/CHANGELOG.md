## Unreleased

- The serial is one `PlateSlot` of one to four digits instead of a `plateRegister` of single cells. A value is one string per slot: `['A', 'B', '1', 'A', '3665']`.
- Removed the `serialDigits` parameter of `MaldivesPlates.of`; one spec per category takes every length, centred in the serial's box.
