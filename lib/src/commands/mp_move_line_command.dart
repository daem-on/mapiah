part of 'mp_command.dart';

class MPMoveLineCommand extends MPCommand {
  final int lineMapiahID;
  final LinkedHashMap<int, THLineSegment> originalLineSegmentsMap;
  late final LinkedHashMap<int, THLineSegment> modifiedLineSegmentsMap;
  final Offset deltaOnCanvas;
  final bool isFromDelta;

  MPMoveLineCommand.forCWJM({
    required this.lineMapiahID,
    required this.originalLineSegmentsMap,
    required this.modifiedLineSegmentsMap,
    required super.oppositeCommand,
    super.description = mpMoveLineCommandDescription,
    this.deltaOnCanvas = Offset.zero,
    this.isFromDelta = false,
  }) : super.forCWJM();

  MPMoveLineCommand({
    required this.lineMapiahID,
    required this.originalLineSegmentsMap,
    required this.modifiedLineSegmentsMap,
    super.description = mpMoveLineCommandDescription,
    this.deltaOnCanvas = Offset.zero,
    this.isFromDelta = false,
  }) : super();

  MPMoveLineCommand.fromDelta({
    required this.lineMapiahID,
    required this.originalLineSegmentsMap,
    required this.deltaOnCanvas,
    super.description = mpMoveLineCommandDescription,
  })  : isFromDelta = true,
        super() {
    modifiedLineSegmentsMap = LinkedHashMap<int, THLineSegment>();
    for (var entry in originalLineSegmentsMap.entries) {
      final int originalLineSegmentMapiahID = entry.key;
      final THLineSegment originalLineSegment = entry.value;
      late THLineSegment modifiedLineSegment;

      switch (originalLineSegment) {
        case THStraightLineSegment _:
          modifiedLineSegment = originalLineSegment.copyWith(
              endPoint: originalLineSegment.endPoint.copyWith(
            coordinates:
                originalLineSegment.endPoint.coordinates + deltaOnCanvas,
          ));
          break;
        case THBezierCurveLineSegment _:
          modifiedLineSegment = originalLineSegment.copyWith(
              endPoint: originalLineSegment.endPoint.copyWith(
                  coordinates:
                      originalLineSegment.endPoint.coordinates + deltaOnCanvas),
              controlPoint1: originalLineSegment.controlPoint1.copyWith(
                  coordinates: originalLineSegment.controlPoint1.coordinates +
                      deltaOnCanvas),
              controlPoint2: originalLineSegment.controlPoint2.copyWith(
                  coordinates: originalLineSegment.controlPoint2.coordinates +
                      deltaOnCanvas));
          break;
      }

      modifiedLineSegmentsMap[originalLineSegmentMapiahID] =
          modifiedLineSegment;
    }
  }

  @override
  MPCommandType get type => MPCommandType.moveLine;

  @override
  void _actualExecute(TH2FileEditStore th2FileEditStore) {
    for (final entry in originalLineSegmentsMap.entries) {
      final int originalLineSegmentMapiahID = entry.key;
      final THLineSegment originalLineSegment = entry.value;
      late MPCommand command;

      switch (originalLineSegment) {
        case THStraightLineSegment _:
          if (isFromDelta) {
            command = MPMoveStraightLineSegmentCommand.fromDelta(
              lineSegmentMapiahID: originalLineSegmentMapiahID,
              originalEndPointCoordinates:
                  originalLineSegment.endPoint.coordinates,
              deltaOnCanvas: deltaOnCanvas,
              description: description,
            );
          } else {
            command = MPMoveStraightLineSegmentCommand(
              lineSegmentMapiahID: originalLineSegmentMapiahID,
              originalEndPointCoordinates:
                  originalLineSegment.endPoint.coordinates,
              modifiedEndPointCoordinates:
                  modifiedLineSegmentsMap[originalLineSegmentMapiahID]!
                      .endPoint
                      .coordinates,
              description: description,
            );
          }
          break;
        case THBezierCurveLineSegment _:
          THBezierCurveLineSegment newLineSegment =
              modifiedLineSegmentsMap[originalLineSegmentMapiahID]
                  as THBezierCurveLineSegment;

          if (isFromDelta) {
            command = MPMoveBezierLineSegmentCommand.fromDelta(
              lineSegmentMapiahID: originalLineSegmentMapiahID,
              originalEndPointCoordinates:
                  originalLineSegment.endPoint.coordinates,
              originalControlPoint1Coordinates:
                  originalLineSegment.controlPoint1.coordinates,
              originalControlPoint2Coordinates:
                  originalLineSegment.controlPoint2.coordinates,
              deltaOnCanvas: deltaOnCanvas,
              description: description,
            );
          } else {
            command = MPMoveBezierLineSegmentCommand(
              lineSegmentMapiahID: originalLineSegmentMapiahID,
              originalEndPointCoordinates:
                  originalLineSegment.endPoint.coordinates,
              modifiedEndPointCoordinates: newLineSegment.endPoint.coordinates,
              originalControlPoint1Coordinates:
                  originalLineSegment.controlPoint1.coordinates,
              modifiedControlPoint1Coordinates:
                  newLineSegment.controlPoint1.coordinates,
              originalControlPoint2Coordinates:
                  originalLineSegment.controlPoint2.coordinates,
              modifiedControlPoint2Coordinates:
                  newLineSegment.controlPoint2.coordinates,
              description: description,
            );
          }
          break;
      }

      command.execute(th2FileEditStore);
    }

    th2FileEditStore.triggerElementActuallyDrawableRedraw(lineMapiahID);
  }

  @override
  MPUndoRedoCommand _createOppositeCommand() {
    final MPMoveLineCommand oppositeCommand = MPMoveLineCommand(
      lineMapiahID: lineMapiahID,
      originalLineSegmentsMap: modifiedLineSegmentsMap,
      modifiedLineSegmentsMap: originalLineSegmentsMap,
      description: description,
    );

    return MPUndoRedoCommand(
        commandType: oppositeCommand.type,
        description: description,
        map: oppositeCommand.toMap());
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'commandType': type.name,
      'lineMapiahID': lineMapiahID,
      'originalLineSegmentsMap': originalLineSegmentsMap.map(
        (key, value) => MapEntry(key.toString(), value.toMap()),
      ),
      'modifiedLineSegmentsMap': modifiedLineSegmentsMap.map(
        (key, value) => MapEntry(key.toString(), value.toMap()),
      ),
      'oppositeCommand': oppositeCommand?.toMap(),
      'description': description,
    };
  }

  factory MPMoveLineCommand.fromMap(Map<String, dynamic> map) {
    return MPMoveLineCommand.forCWJM(
      lineMapiahID: map['lineMapiahID'],
      originalLineSegmentsMap: LinkedHashMap<int, THLineSegment>.fromEntries(
        (map['originalLineSegmentsMap'] as Map<String, dynamic>).entries.map(
              (e) => MapEntry(
                int.parse(e.key),
                THLineSegment.fromMap(e.value),
              ),
            ),
      ),
      modifiedLineSegmentsMap: LinkedHashMap<int, THLineSegment>.fromEntries(
        (map['modifiedLineSegmentsMap'] as Map<String, dynamic>).entries.map(
              (e) => MapEntry(
                int.parse(e.key),
                THLineSegment.fromMap(e.value),
              ),
            ),
      ),
      oppositeCommand: map['oppositeCommand'] == null
          ? null
          : MPUndoRedoCommand.fromMap(map['oppositeCommand']),
      description: map['description'],
    );
  }

  factory MPMoveLineCommand.fromJson(String source) {
    return MPMoveLineCommand.fromMap(jsonDecode(source));
  }

  @override
  MPMoveLineCommand copyWith({
    int? lineMapiahID,
    LinkedHashMap<int, THLineSegment>? originalLineSegmentsMap,
    LinkedHashMap<int, THLineSegment>? modifiedLineSegmentsMap,
    MPUndoRedoCommand? oppositeCommand,
    String? description,
  }) {
    return MPMoveLineCommand.forCWJM(
      lineMapiahID: lineMapiahID ?? this.lineMapiahID,
      originalLineSegmentsMap:
          originalLineSegmentsMap ?? this.originalLineSegmentsMap,
      modifiedLineSegmentsMap:
          modifiedLineSegmentsMap ?? this.modifiedLineSegmentsMap,
      oppositeCommand: oppositeCommand ?? this.oppositeCommand,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MPMoveLineCommand &&
        other.lineMapiahID == lineMapiahID &&
        const DeepCollectionEquality()
            .equals(other.originalLineSegmentsMap, originalLineSegmentsMap) &&
        const DeepCollectionEquality()
            .equals(other.modifiedLineSegmentsMap, modifiedLineSegmentsMap) &&
        other.oppositeCommand == oppositeCommand &&
        other.description == description;
  }

  @override
  int get hashCode => Object.hash(
        lineMapiahID,
        Object.hashAll(originalLineSegmentsMap.entries),
        Object.hashAll(modifiedLineSegmentsMap.entries),
        oppositeCommand,
        description,
      );
}
