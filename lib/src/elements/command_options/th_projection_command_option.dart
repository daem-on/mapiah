import 'dart:convert';

import 'package:mapiah/src/elements/command_options/th_command_option.dart';
import 'package:mapiah/src/exceptions/th_convert_from_string_exception.dart';
import 'package:mapiah/src/elements/parts/th_angle_unit_part.dart';
import 'package:mapiah/src/elements/parts/th_double_part.dart';

enum THProjectionTypes {
  elevation,
  extended,
  none,
  plan,
}

// projection <specification> . specifies the drawing projection. Each projection is
// identified by a type and optionally by an index in the form type[:index]. The index
// can be any keyword. The following projection types are supported:
// 1. none . no projection, used for cross sections or maps that are independent of survey
// data (e.g. digitization of old maps where no centreline data are available). No index is
// allowed for this projection.
// 2. plan . basic plan projection (default).
// 3. elevation . orthogonal projection (a.k.a. projected profile) which optionally takes
// a view direction as an argument (e.g. [elevation 10] or [elevation 10 deg]).
// 4. extended . extended elevation (a.k.a. extended profile).
class THProjectionCommandOption extends THCommandOption {
  late final THProjectionTypes type;
  final String index;
  late final THDoublePart? elevationAngle;
  late final THAngleUnitPart? elevationUnit;

  static const stringToType = {
    'elevation': THProjectionTypes.elevation,
    'extended': THProjectionTypes.extended,
    'none': THProjectionTypes.none,
    'plan': THProjectionTypes.plan,
  };

  static const typeToString = {
    THProjectionTypes.elevation: 'elevation',
    THProjectionTypes.extended: 'extended',
    THProjectionTypes.none: 'none',
    THProjectionTypes.plan: 'plan',
  };

  THProjectionCommandOption.forCWJM({
    required super.parentMapiahID,
    required this.type,
    this.index = '',
    this.elevationAngle,
    this.elevationUnit,
  }) : super.forCWJM();

  THProjectionCommandOption.fromString({
    required super.optionParent,
    required String type,
    this.index = '',
    required String elevationAngle,
    required String elevationUnit,
  }) : super() {
    typeFromString(type);
    this.elevationAngle = THDoublePart.fromString(valueString: elevationAngle);
    this.elevationUnit = THAngleUnitPart.fromString(unitString: elevationUnit);
  }

  @override
  THCommandOptionType get optionType => THCommandOptionType.projection;

  @override
  Map<String, dynamic> toMap() {
    var asMap = {
      'parentMapiahID': parentMapiahID,
      'type': typeToString[type],
      'index': index,
    };
    if (elevationAngle != null) {
      asMap['elevationAngle'] = elevationAngle!.toMap();
    }
    if (elevationUnit != null) {
      asMap['elevationUnit'] = elevationUnit!.toMap();
    }

    return asMap;
  }

  factory THProjectionCommandOption.fromMap(Map<String, dynamic> map) {
    return THProjectionCommandOption.forCWJM(
      parentMapiahID: map['parentMapiahID'],
      type: stringToType[map['type']]!,
      index: map['index'],
      elevationAngle: THDoublePart.fromMap(map['elevationAngle']),
      elevationUnit: THAngleUnitPart.fromMap(map['elevationUnit']),
    );
  }

  factory THProjectionCommandOption.fromJson(String jsonString) {
    return THProjectionCommandOption.fromMap(jsonDecode(jsonString));
  }

  @override
  THProjectionCommandOption copyWith({
    int? parentMapiahID,
    THProjectionTypes? type,
    String? index,
    THDoublePart? elevationAngle,
    THAngleUnitPart? elevationUnit,
  }) {
    return THProjectionCommandOption.forCWJM(
      parentMapiahID: parentMapiahID ?? this.parentMapiahID,
      type: type ?? this.type,
      index: index ?? this.index,
      elevationAngle: elevationAngle ?? this.elevationAngle,
      elevationUnit: elevationUnit ?? this.elevationUnit,
    );
  }

  @override
  bool operator ==(covariant THProjectionCommandOption other) {
    if (identical(this, other)) return true;

    return other.parentMapiahID == parentMapiahID &&
        other.type == type &&
        other.index == index &&
        other.elevationAngle == elevationAngle &&
        other.elevationUnit == elevationUnit;
  }

  @override
  int get hashCode => Object.hash(
        parentMapiahID,
        type,
        index,
        elevationAngle,
        elevationUnit,
      );

  static bool isType(String aType) {
    return stringToType.containsKey(aType);
  }

  void typeFromString(String type) {
    if (!THProjectionCommandOption.isType(type)) {
      throw THConvertFromStringException(runtimeType.toString(), type);
    }

    this.type = stringToType[type]!;
  }

  @override
  String specToFile() {
    String asString = '';

    asString += THProjectionCommandOption.typeToString[type]!;

    if (index.isNotEmpty && index.trim().isNotEmpty) {
      asString += ':${index.trim()}';
    }

    if (type == THProjectionTypes.elevation) {
      if (elevationAngle != null) {
        asString += " ${elevationAngle.toString()}";
        if (elevationUnit != null) {
          asString += " ${elevationUnit.toString()}";
        }
      }
    }

    asString = asString.trim();

    if (asString.contains(' ')) {
      asString = "[ $asString ]";
    }

    return asString;
  }
}
