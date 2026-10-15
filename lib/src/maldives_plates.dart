import 'dart:math';

import 'package:plate_core/plate_core.dart';

import 'maldives_alphabets.dart';
import 'maldives_country.dart';
import 'maldives_usage.dart';

/// Where the ink sits on the 2003 Maldivian plates.
///
/// The article gives no size, so the canvas is the artwork's own 461×273
/// (aspect 1.69) and every number is a pixel measured off the three artwork
/// JPEGs (`Maldives_privat_plate_graphic`, `…_taxi_…`, `…_diplomatic_…`),
/// which share one geometry to the pixel. The photographed plate in the
/// article is a long 2.95 format; it is not implemented.
///
/// Measured ink:
///
/// * Frame: a line 8 thick floating inside the edge, x 17..25 and 437..445,
///   y 14..22 and 251..259; the field shows outside it.
/// * Top row, y 48..93 (46 tall, cy 70.5): `A` x 118..166, the two-character
///   category x 189..272 (cells 43 apart), `A` x 296..344.
/// * Bottom row, y 150..220 (71 tall, cy 185): the type letter x 62..119,
///   the four digits x 158..403 (pitch 64, centre 280.5).
///
/// Cap ink is ~0.53 of the box height (`glyphStyle` sets the font to 0.72 of
/// it), so the boxes are 88 and 135 tall for ink of 46 and 71; the first golden
/// inked 1.3–1.5 high and 0.5–0.7 short, hence the 1.3 and 1.5 offsets from
/// the ink centres.
///
/// The frame is painted in the background as the divider colour, which the
/// themes make the ink colour; the theme's own border is zero.
abstract final class _Layout {
  static const double width = 461, height = 273;

  static const double topCy = 71.8, topBox = 88;
  static const double bottomCy = 186.5, bottomBox = 135;

  static const double firstCx = 142, lastCx = 320;
  static const double categoryCx = 230.5, categoryPitch = 43;
  static const double singleWidth = 64;

  static const double serialCx = 280.5, serialPitch = 64;
  static const double letterCx = 90.5;

  /// The ring: outside it, the field; the line itself, the divider colour.
  static const PlateSection frame = PlateSection.columns(<PlatePart>[
    PlatePart(PlateSection.plain, end: 17),
    PlatePart(
      PlateSection.rows(<PlatePart>[
        PlatePart(PlateSection.plain, end: 14),
        PlatePart(
          PlateSection.columns(<PlatePart>[
            PlatePart(PlateSection.fill(PlateFill.divider), end: 25),
            PlatePart(
              PlateSection.rows(<PlatePart>[
                PlatePart(PlateSection.fill(PlateFill.divider), end: 22),
                PlatePart(PlateSection.plain, end: 251),
                PlatePart(PlateSection.fill(PlateFill.divider)),
              ]),
              end: 437,
            ),
            PlatePart(PlateSection.fill(PlateFill.divider)),
          ]),
          end: 259,
        ),
        PlatePart(PlateSection.plain),
      ]),
      end: 445,
    ),
    PlatePart(PlateSection.plain),
  ]);
}

/// The Maldives' licence plates: one design, six categories.
///
/// The top row is a letter, a two-character vehicle category code (`B1`) and a
/// letter; the bottom row the category's type letter and up to four digits.
/// Text groups: `first`, `category`, `last`, `serial`. The type letter is a
/// label. Pair `private`, `commercial`, `government` and `police` with
/// `MaldivesThemes.black`, `taxi` with `.yellow`, `diplomatic` with `.blue`.
///
/// The article lists no Israel-specific value. Not implemented: the pre-1984,
/// 1984 and 1998 series.
abstract final class MaldivesPlates {
  static final Map<String, PlateSpec> _cache = <String, PlateSpec>{};

  static PlateSpec of(MaldivesCategory category) =>
      _cache[category.id] ??= _spec('mv.${category.id}', category);

  static PlateSpec get private => of(MaldivesCategory.private);
  static PlateSpec get commercial => of(MaldivesCategory.commercial);
  static PlateSpec get government => of(MaldivesCategory.government);
  static PlateSpec get police => of(MaldivesCategory.police);
  static PlateSpec get taxi => of(MaldivesCategory.taxi);
  static PlateSpec get diplomatic => of(MaldivesCategory.diplomatic);

  /// Every category.
  static List<PlateSpec> get all => <PlateSpec>[
    for (final c in MaldivesCategory.values) of(c),
  ];

  static PlateSpec _spec(String id, MaldivesCategory category) {
    final slots = <PlateSlot>[];
    final groups = <PlateTextGroup>[];

    void run(
      String? key,
      PlateAlphabet alphabet,
      int count,
      double cx,
      double pitch,
      double cy,
      double height, {
      int? minLength,
    }) {
      if (key != null) {
        groups.add(PlateTextGroup(<int>[slots.length], key: key));
      }
      slots.add(
        PlateSlot(
          alphabet: alphabet,
          box: PlateBox(
            cx - count * pitch / 2,
            cy - height / 2,
            count * pitch,
            height,
          ),
          length: count,
          minLength: minLength,
          spacing: max(0, pitch - 0.6 * 0.72 * height),
        ),
      );
    }

    const w = _Layout.singleWidth;
    const top = _Layout.topCy, box = _Layout.topBox;
    run('first', MaldivesAlphabets.letters, 1, _Layout.firstCx, w, top, box);
    // The category is a letter then a digit: two alphabets, so two runs
    // under one group.
    final categoryStart = slots.length;
    const cp = _Layout.categoryPitch;
    final cx = _Layout.categoryCx;
    run(null, MaldivesAlphabets.letters, 1, cx - cp / 2, cp, top, box);
    run(null, MaldivesAlphabets.digits, 1, cx + cp / 2, cp, top, box);
    groups.add(
      PlateTextGroup(<int>[categoryStart, categoryStart + 1], key: 'category'),
    );
    run('last', MaldivesAlphabets.letters, 1, _Layout.lastCx, w, top, box);
    run(
      'serial',
      MaldivesAlphabets.digits,
      4,
      _Layout.serialCx,
      _Layout.serialPitch,
      _Layout.bottomCy,
      _Layout.bottomBox,
      minLength: 1,
    );

    return PlateSpec(
      id: id,
      country: MaldivesCountry.maldives,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: true,
      background: _Layout.frame,
      borderWidthRatioOverride: 0,
      slots: slots,
      labels: <PlateLabel>[
        PlateLabel(
          text: category.letter,
          box: PlateBox(
            _Layout.letterCx - w / 2,
            _Layout.bottomCy - _Layout.bottomBox / 2,
            w,
            _Layout.bottomBox,
          ),
          glyphHeight: _Layout.bottomBox,
        ),
      ],
      textGroups: groups,
    );
  }
}
