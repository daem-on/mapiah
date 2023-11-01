import 'package:mapiah/src/th_elements/th_element.dart';
import 'package:mapiah/src/th_file_aux/th_file_parser.dart';
import 'package:mapiah/src/th_file_aux/th_file_writer.dart';
import 'package:mapiah/src/th_file_aux/th_grammar.dart';
import 'package:petitparser/debug.dart';
import 'package:test/test.dart';

void main() {
  group('point', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00070-point_only.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 2596.0 -468.0 debris
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00074-point_invalid_type_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -align', () {
    final parser = THFileParser();
    final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02200-point_with_align_main_choice_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 122.0031 321.9712 ex-voto -align top-right
endscrap
''',
      },
      {
        'file':
            'th_file_parser-02201-point_with_align_alternate_choice_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 122.0031 321.9712 ex-voto -align center
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -clip', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02230-point_with_clip_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 122.0031 321.9712 mud -clip off
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -clip failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02231-point_with_invalid_clip_option_failure.th2',
      'th_file_parser-02232-point_with_clip_option_on_invalid_point_type_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -context', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00140-point_with_context_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -104.04 75 date -context line fault
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -context failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00141-point_with_invalid_context_type_failure.th2',
      'th_file_parser-00142-point_with_incomplete_context_option_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -dist', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00150-point_with_dist_option.th2',
        'length': 6,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -4882 -2163 extra -dist 18
endscrap


''',
      },
      {
        'file': 'th_file_parser-00151-point_with_dist_option_with_unit.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -4381 -253 extra -dist [ 2450 cm ]
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -dist failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00152-point_with_invalid_dist_option_unsupported_unit_failure.th2',
      'th_file_parser-00153-point_with_invalid_dist_option_no_number_failure.th2',
      'th_file_parser-00154-point_with_invalid_type_for_dist_option_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -extend', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file':
            'th_file_parser-00160-point_with_extend_option_without_previous_station.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -2675 2206 station -extend
endscrap
''',
      },
      {
        'file':
            'th_file_parser-00161-point_with_extend_option_with_previous_station.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -3218 -2379 station -extend previous a12
endscrap
''',
      },
      {
        'file':
            'th_file_parser-00162-point_with_extend_option_with_alternate_previous_station.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -4747 -2577 station -extend previous c33
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -extend failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00163-point_with_extend_option_with_alternate_previous_missing_station_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -from', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02240-point_with_from_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -4882 -2163 extra -from a18
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -from failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02241-point_with_from_option_on_invalid_point_type_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -id', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00072-point_with_option_and_id.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 782.0 -1740.0 station -subtype fixed -id A2
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -id failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02250-point_with_incomplete_option_id_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -name', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02263-point_with_only_option_name.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 782.0 -1740.0 station -name A2@final_de_semana
endscrap
''',
      },
      {
        'file': 'th_file_parser-02260-point_with_option_name.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 782.0 -1740.0 station -subtype fixed -name A2@final_de_semana -id A2
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -name failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02261-point_with_option_name_with_unsupported_point_type_failure.th2',
      'th_file_parser-02262-point_with_option_name_without_reference_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -orientation', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00126-point_with_orientation_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 122.0031 321.9712 ex-voto -orientation 173.23
endscrap
''',
      },
      {
        'file':
            'th_file_parser-00127-point_with_alternative_id_for_orientation_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 4122 9321 electric-light -orientation 297.0
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -orientation failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00128-point_with_invalid_orientation_option_value_failure.th2',
      'th_file_parser-00129-point_with_orientation_option_with_unit_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -place', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02210-point_with_place_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 122.0031 321.9712 vegetable-debris -place bottom
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -place failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02211-point_with_invalid_place_option_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -scale', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00130-point_with_preset_scale_value.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point -949.68 -354.61 altitude -scale xs
endscrap
''',
      },
      {
        'file': 'th_file_parser-00131-point_with_numeric_scale_value.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 717.49 552.12 date -scale 2.84
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -scale failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00132-point_with_invalid_scale_value_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -scrap', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02270-point_with_option_section.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 782.0 -1740.0 section -scrap end_tunnel
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -scrap failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02271-point_with_option_section_on_invalid_point_type_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -subtype', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-00122-point_with_inline_subtype.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 43 336 water-flow -subtype paleo
endscrap
''',
      },
      {
        'file': 'th_file_parser-00123-point_with_subtype_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 43 336 water-flow -subtype paleo
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -subtype failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-00124-point_with_invalid_subtype_for_type_failure.th2',
      'th_file_parser-00125-point_with_subtype_for_type_with_no_support_failure.th2',
      'th_file_parser-00126-point_outside_scrap_failure.th2',
      'th_file_parser-00127-point_duplicate_index_with_type_as_option_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });

  group('point -visibility', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const successes = [
      {
        'file': 'th_file_parser-02220-point_with_visibility_option.th2',
        'length': 4,
        'encoding': 'UTF-8',
        'asFile': r'''encoding UTF-8
scrap test
  point 122.0031 321.9712 masonry -visibility on
endscrap
''',
      },
    ];

    for (var success in successes) {
      test(success, () async {
        final (file, isSuccessful, _) =
            await parser.parse((success['file'] as String));
        // final (file, isSuccessful, errors) = await parser.parse((success['file'] as String),
        //     startParser: grammar.start());
        expect(isSuccessful, true);
        expect(file, isA<THFile>());
        expect(file.encoding, (success['encoding'] as String));
        expect(file.countElements(), success['length']);

        final asFile = writer.serialize(file);
        expect(asFile, success['asFile']);
      });
    }
  });

  group('point -visibility failures', () {
    final parser = THFileParser();
    // final grammar = THGrammar();
    final writer = THFileWriter();

    const failures = [
      'th_file_parser-02221-point_with_invalid_visibility_option_failure.th2',
    ];

    for (var failure in failures) {
      test(failure, () async {
        final (_, isSuccessful, error) = await parser.parse(failure);
        expect(isSuccessful, false);
      });
    }
  });
}
