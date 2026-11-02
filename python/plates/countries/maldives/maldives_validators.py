"""Port of maldives_plate/lib/src/maldives_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits


class MaldivesPlateValidator(GatedPlateValidator):
    gate_group = 'serial'

    reason_category = "Not a vehicle category code in the published table."
    reason_serial = "The serial is 1\u20134 digits."
    categories = frozenset(("A0", "A1", "B0", "B1", "B2", "C0", "C1", "C2"))

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if entry.group("category") not in self.categories:
            return PlateValidation.invalid(self.reason_category)
        s = entry.group("serial")
        if not is_digits(s) or len(s) > 4:
            return PlateValidation.invalid(self.reason_serial)
        return PlateValidation.valid()
