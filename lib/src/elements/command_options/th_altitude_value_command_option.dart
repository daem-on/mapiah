import 'dart:convert';

import 'package:mapiah/src/elements/command_options/th_command_option.dart';
import 'package:mapiah/src/elements/command_options/th_has_length.dart';
import 'package:mapiah/src/elements/parts/th_length_unit_part.dart';
import 'package:mapiah/src/elements/th_has_altitude.dart';
import 'package:mapiah/src/elements/parts/th_double_part.dart';

// altitude: the value specified is the altitude difference from the nearest station. The
// value will be set to 0 if defined as ‘-’, ‘.’, ‘nan’, ‘NAN’ or ‘NaN’. If the altitude value is
// prefixed by ‘fix’ (e.g. -value [fix 1300]), this value is used as an absolute altitude.
// The value can optionally be followed by length units.
class THAltitudeValueCommandOption extends THCommandOption
    with THHasLength, THHasAltitude {
  THAltitudeValueCommandOption({
    required super.parentMapiahID,
    required THDoublePart length,
    required bool isFix,
    required THLengthUnitPart unit,
  }) : super() {
    this.length = length;
    this.isFix = isFix;
    this.unit = unit;
  }

  THAltitudeValueCommandOption.addToOptionParent({
    required super.optionParent,
    required THDoublePart length,
    required bool isFix,
    required String? unit,
  }) : super.addToOptionParent() {
    this.length = length;
    this.isFix = isFix;
    unitFromString(unit);
  }

  THAltitudeValueCommandOption.fromString({
    required super.optionParent,
    required String height,
    required bool isFix,
    required String? unit,
  }) : super.addToOptionParent() {
    length = THDoublePart.fromString(valueString: height);
    isFix = isFix;
    unitFromString(unit);
  }

  THAltitudeValueCommandOption.fromNan({required super.optionParent})
      : super.addToOptionParent() {
    length = THDoublePart.fromString(valueString: '0');
    isNan = true;
    unitFromString('');
  }

  @override
  THCommandOptionType get optionType => THCommandOptionType.altitudeValue;

  @override
  Map<String, dynamic> toMap() {
    return {
      'parentMapiahID': parentMapiahID,
      'length': length.toMap(),
      'isFix': isFix,
      'unit': unit,
    };
  }

  factory THAltitudeValueCommandOption.fromMap(Map<String, dynamic> map) {
    return THAltitudeValueCommandOption(
      parentMapiahID: map['parentMapiahID'],
      length: THDoublePart.fromMap(map['length']),
      isFix: map['isFix'],
      unit: map['unit'],
    );
  }

  factory THAltitudeValueCommandOption.fromJson(String jsonString) {
    return THAltitudeValueCommandOption.fromMap(jsonDecode(jsonString));
  }

  @override
  THAltitudeValueCommandOption copyWith({
    int? parentMapiahID,
    THDoublePart? length,
    bool? isFix,
    THLengthUnitPart? unit,
  }) {
    return THAltitudeValueCommandOption(
      parentMapiahID: parentMapiahID ?? this.parentMapiahID,
      length: length ?? this.length,
      isFix: isFix ?? this.isFix,
      unit: unit ?? this.unit,
    );
  }

  @override
  bool operator ==(covariant THAltitudeValueCommandOption other) {
    if (identical(this, other)) return true;

    return other.parentMapiahID == parentMapiahID &&
        other.length == length &&
        other.isFix == isFix &&
        other.unit == unit;
  }

  @override
  int get hashCode => Object.hash(
        parentMapiahID,
        length,
        isFix,
        unit,
      );
}
