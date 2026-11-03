import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:maldives_plate/maldives_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: MaldivesPlates.standard, theme: MaldivesThemes.black),
);
