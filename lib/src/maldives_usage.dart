import 'package:flutter/foundation.dart';

/// A plate category: the letter before the serial, which with the field
/// colour tells the six apart.
@immutable
class MaldivesCategory {
  const MaldivesCategory._(this.id, this.name, this.letter);

  /// Stable identifier, used in spec ids.
  final String id;

  final String name;

  final String letter;

  static const MaldivesCategory private = MaldivesCategory._('private', 'Private', 'P');
  static const MaldivesCategory commercial = MaldivesCategory._('commercial', 'Commercial', 'C');
  static const MaldivesCategory government = MaldivesCategory._('government', 'Government', 'G');
  static const MaldivesCategory police = MaldivesCategory._('police', 'Police', 'S');
  static const MaldivesCategory taxi = MaldivesCategory._('taxi', 'Taxi', 'T');
  static const MaldivesCategory diplomatic = MaldivesCategory._('diplomatic', 'Diplomatic', 'D');

  static const List<MaldivesCategory> values = <MaldivesCategory>[
    private,
    commercial,
    government,
    police,
    taxi,
    diplomatic,
  ];

  @override
  String toString() => 'MaldivesCategory.$id';
}
