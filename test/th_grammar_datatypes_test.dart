import 'package:petitparser/petitparser.dart';
import 'package:petitparser/debug.dart';
import 'package:th_parser/src/th_grammar.dart';
import 'package:test/test.dart';

void main() {
  group('keyword', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.keyword()).end();

    const successes = [
      'point',
      '_secretKeywork49/',
      '  /strange39',
      '09992  ',
      ' cmyk-rgb  ',
    ];

    for (var success in successes) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, success.trim());
      });
    }

    const failures = [
      '-point',
      '_secret*Keywork49/',
      '/st+range39',
      '099.92',
      'cmy,k-rgb',
      "OSGB'",
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });

  group('extkeyword', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.extKeyword()).end();

    const successes = [
      'point',
      '_secretKeywork49/',
      '/strange39',
      '09992',
      ' cmyk-rgb',
      '_secret*Keywork49/  ',
      '/st+range39',
      '099.92',
      'cmy,k-rgb',
      "OSGB'",
    ];

    for (var success in successes) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, success.trim());
      });
    }

    const failures = [
      '-point',
      '+secret*Keywork49/',
      '.st+range39',
      ',099.92',
      "'cmy,k-rgb",
      "*OSGB'",
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });

  group('noDate', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.noDateTime()).end();

    const successes = [
      '-',
    ];

    for (var success in successes) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, success.trim());
      });
    }

    const failures = [
      '+',
      '.',
      ',',
      "'",
      "*",
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });

  group('singleDateTime', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.singleDateTime()).end();

    const successes = {
      '2022.2.5': [
        '2022',
        [
          '2',
          ['5', null]
        ]
      ],
      '2022.02.9@2:30': [
        '2022',
        [
          '02',
          [
            '9',
            [
              '2',
              ['30', null]
            ]
          ]
        ]
      ],
      '2021.12.23@8:30:1': [
        '2021',
        [
          '12',
          [
            '23',
            [
              '8',
              [
                '30',
                ['1', null]
              ]
            ]
          ]
        ]
      ],
      '22.02.09@02:30:07  ': [
        '22',
        [
          '02',
          [
            '09',
            [
              '02',
              [
                '30',
                ['07', null]
              ]
            ]
          ]
        ]
      ],
      '2021.02': [
        '2021',
        ['02', null]
      ],
      ' 2022.02.05': [
        '2022',
        [
          '02',
          ['05', null]
        ]
      ],
      '2022.02.13@11:27:32': [
        '2022',
        [
          '02',
          [
            '13',
            [
              '11',
              [
                '27',
                ['32', null]
              ]
            ]
          ]
        ]
      ],
      '2022.02.13@11:58:00.32': [
        '2022',
        [
          '02',
          [
            '13',
            [
              '11',
              [
                '58',
                ['00', '32']
              ]
            ]
          ]
        ]
      ],
    };

    for (var success in successes.keys) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, successes[success]);
      });
    }

    const failures = [
      '2022.',
      '2022:02.9',
      '2022.02.13.11',
      '2022.02.13@',
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });

  group('dateTimeRange', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.dateTimeRange()).end();

    const successes = {
      '2022.02.13@11:27:32 - 2022.02.13@11:58:00': [
        [
          '2022',
          [
            '02',
            [
              '13',
              [
                '11',
                [
                  '27',
                  ['32', null]
                ]
              ]
            ]
          ]
        ],
        [
          '2022',
          [
            '02',
            [
              '13',
              [
                '11',
                [
                  '58',
                  ['00', null]
                ]
              ]
            ]
          ]
        ]
      ],
      '2021.12.23@8:30:1 - 2022.2.09@2:30:7': [
        [
          '2021',
          [
            '12',
            [
              '23',
              [
                '8',
                [
                  '30',
                  ['1', null]
                ]
              ]
            ]
          ]
        ],
        [
          '2022',
          [
            '2',
            [
              '09',
              [
                '2',
                [
                  '30',
                  ['7', null]
                ]
              ]
            ]
          ]
        ]
      ],
      '2021.12.23 - 2022.02.9@2:30 ': [
        [
          '2021',
          [
            '12',
            ['23', null]
          ]
        ],
        [
          '2022',
          [
            '02',
            [
              '9',
              [
                '2',
                ['30', null]
              ]
            ]
          ]
        ]
      ],
      '2021.12.23 -\\\n2022.02.9@2:30 ': [
        [
          '2021',
          [
            '12',
            ['23', null]
          ]
        ],
        [
          '2022',
          [
            '02',
            [
              '9',
              [
                '2',
                ['30', null]
              ]
            ]
          ]
        ]
      ],
    };

    for (var success in successes.keys) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, successes[success]);
      });
    }

    const failures = [
      '2021.12.23@8:30:1',
      '22.02.09@02:30:07  ',
      '2021.02',
      '2022.02.13@11:27:32',
      '2022.02.13@11:58:00.32',
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });

  group('dateTime', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.dateTime()).end();

    const successes = [
      '-',
    ];

    for (var success in successes) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, success.trim());
      });
    }

    const failures = [
      '+',
      '.',
      ',',
      "'",
      "*",
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }

    const mapSuccesses = {
      '2022.2.5': [
        '2022',
        [
          '2',
          ['5', null]
        ]
      ],
      '2022.02.9@2:30': [
        '2022',
        [
          '02',
          [
            '9',
            [
              '2',
              ['30', null]
            ]
          ]
        ]
      ],
      '2021.12.23@8:30:1': [
        '2021',
        [
          '12',
          [
            '23',
            [
              '8',
              [
                '30',
                ['1', null]
              ]
            ]
          ]
        ]
      ],
      '22.02.09@02:30:07  ': [
        '22',
        [
          '02',
          [
            '09',
            [
              '02',
              [
                '30',
                ['07', null]
              ]
            ]
          ]
        ]
      ],
      '2021.02': [
        '2021',
        ['02', null]
      ],
      ' 2022.02.05': [
        '2022',
        [
          '02',
          ['05', null]
        ]
      ],
      '2022.02.13@11:27:32': [
        '2022',
        [
          '02',
          [
            '13',
            [
              '11',
              [
                '27',
                ['32', null]
              ]
            ]
          ]
        ]
      ],
      '2022.02.13@11:58:00.32': [
        '2022',
        [
          '02',
          [
            '13',
            [
              '11',
              [
                '58',
                ['00', '32']
              ]
            ]
          ]
        ]
      ],
      '2022.02.13@11:27:32 - 2022.02.13@11:58:00': [
        [
          '2022',
          [
            '02',
            [
              '13',
              [
                '11',
                [
                  '27',
                  ['32', null]
                ]
              ]
            ]
          ]
        ],
        [
          '2022',
          [
            '02',
            [
              '13',
              [
                '11',
                [
                  '58',
                  ['00', null]
                ]
              ]
            ]
          ]
        ]
      ],
      '2021.12.23@8:30:1 - 2022.2.09@2:30:7': [
        [
          '2021',
          [
            '12',
            [
              '23',
              [
                '8',
                [
                  '30',
                  ['1', null]
                ]
              ]
            ]
          ]
        ],
        [
          '2022',
          [
            '2',
            [
              '09',
              [
                '2',
                [
                  '30',
                  ['7', null]
                ]
              ]
            ]
          ]
        ]
      ],
      '2021.12.23 - 2022.02.9@2:30 ': [
        [
          '2021',
          [
            '12',
            ['23', null]
          ]
        ],
        [
          '2022',
          [
            '02',
            [
              '9',
              [
                '2',
                ['30', null]
              ]
            ]
          ]
        ]
      ],
      '2021.12.23 -\\\n2022.02.9@2:30 ': [
        [
          '2021',
          [
            '12',
            ['23', null]
          ]
        ],
        [
          '2022',
          [
            '02',
            [
              '9',
              [
                '2',
                ['30', null]
              ]
            ]
          ]
        ]
      ],
    };

    for (var success in mapSuccesses.keys) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, mapSuccesses[success]);
      });
    }

    const mapFailures = [
      '2022.',
      '2022:02.9',
      '2022.02.13.11',
      '2022.02.13@',
    ];

    for (var failure in mapFailures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });

  group('aString', () {
    final grammar = THGrammar();
    final parser = grammar.buildFrom(grammar.aString()).end();

    const successes = {
      '"blaus"': 'blaus',
      '""': '',
      '"""Obs"" hein?"': '""Obs"" hein?'
    };

    for (var success in successes.keys) {
      test(success, () {
        final result = parser.parse(success);
        expect(result.runtimeType.toString(), contains('Success'));
        expect(result.value, successes[success]);
      });
    }

    const failures = [
      '"""Obs"" hein?',
      'blaus"',
      '"blaus',
    ];

    for (var failure in failures) {
      test(failure, () {
        final result = parser.parse(failure);
        expect(result.runtimeType.toString(), 'Failure');
      });
    }
  });
}