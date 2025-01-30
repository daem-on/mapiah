part of 'th_element.dart';

// [LINE DATA] specify the coordinates of a line segment <x> <y>.
class THStraightLineSegment extends THLineSegment with THHasOptionsMixin {
  THStraightLineSegment.forCWJM({
    required super.mapiahID,
    required super.parentMapiahID,
    super.sameLineComment,
    required super.endPoint,
    required super.optionsMap,
    required super.originalLineInTH2File,
  }) : super.forCWJM();

  THStraightLineSegment({
    required super.parentMapiahID,
    super.sameLineComment,
    required super.endPoint,
    super.originalLineInTH2File = '',
  }) : super.withEndPoint();

  @override
  THElementType get elementType => THElementType.straightLineSegment;

  THStraightLineSegment.fromString({
    required super.parentMapiahID,
    super.sameLineComment,
    required List<dynamic> pointDataList,
    super.originalLineInTH2File = '',
  }) : super.withoutEndPoint() {
    endPoint = THPositionPart.fromStringList(list: pointDataList);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'elementType': elementType.name,
      'mapiahID': mapiahID,
      'parentMapiahID': parentMapiahID,
      'sameLineComment': sameLineComment,
      'endPoint': endPoint.toMap(),
      'optionsMap':
          optionsMap.map((key, value) => MapEntry(key, value.toMap())),
    };
  }

  factory THStraightLineSegment.fromMap(Map<String, dynamic> map) {
    return THStraightLineSegment.forCWJM(
      mapiahID: map['mapiahID'],
      parentMapiahID: map['parentMapiahID'],
      sameLineComment: map['sameLineComment'],
      originalLineInTH2File: map['originalLineInTH2File'],
      endPoint: THPositionPart.fromMap(map['endPoint']),
      optionsMap: LinkedHashMap<String, THCommandOption>.from(
        map['optionsMap']
            .map((key, value) => MapEntry(key, THCommandOption.fromMap(value))),
      ),
    );
  }

  factory THStraightLineSegment.fromJson(String jsonString) {
    return THStraightLineSegment.fromMap(jsonDecode(jsonString));
  }

  @override
  THStraightLineSegment copyWith({
    int? mapiahID,
    int? parentMapiahID,
    String? sameLineComment,
    bool makeSameLineCommentNull = false,
    String? originalLineInTH2File,
    THPositionPart? endPoint,
    LinkedHashMap<String, THCommandOption>? optionsMap,
  }) {
    return THStraightLineSegment.forCWJM(
      mapiahID: mapiahID ?? this.mapiahID,
      parentMapiahID: parentMapiahID ?? this.parentMapiahID,
      sameLineComment: makeSameLineCommentNull
          ? null
          : (sameLineComment ?? this.sameLineComment),
      originalLineInTH2File:
          originalLineInTH2File ?? this.originalLineInTH2File,
      endPoint: endPoint ?? this.endPoint,
      optionsMap: optionsMap ?? this.optionsMap,
    );
  }

  @override
  bool operator ==(covariant THStraightLineSegment other) {
    if (identical(this, other)) return true;

    return other.mapiahID == mapiahID &&
        other.parentMapiahID == parentMapiahID &&
        other.sameLineComment == sameLineComment &&
        other.endPoint == endPoint &&
        const DeepCollectionEquality().equals(other.optionsMap, optionsMap);
  }

  @override
  int get hashCode => Object.hash(
        mapiahID,
        parentMapiahID,
        sameLineComment,
        endPoint,
        optionsMap,
      );

  @override
  bool isSameClass(Object object) {
    return object is THStraightLineSegment;
  }

  @override
  Rect _calculateBoundingBox(Offset startPoint) {
    return MPNumericAux.orderedRectFromPoints(
      point1: startPoint,
      point2: endPoint.coordinates,
    );
  }
}
