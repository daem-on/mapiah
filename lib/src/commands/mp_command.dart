import 'dart:convert';

import 'package:mapiah/src/commands/mp_move_bezier_line_segment_command.dart';
import 'package:mapiah/src/commands/mp_move_line_command.dart';
import 'package:mapiah/src/commands/mp_move_point_command.dart';
import 'package:mapiah/src/commands/mp_move_straight_line_segment_command.dart';
import 'package:mapiah/src/stores/th_file_store.dart';
import 'package:mapiah/src/undo_redo/mp_undo_redo_command.dart';

enum MPCommandType {
  moveBezierLineSegment,
  moveLine,
  movePoint,
  moveStraightLineSegment,
}

/// Abstract class that defines the structure of a command.
///
/// It is responsible both for executing and undoing the command, therefore, all
/// actions that should support undo must be impmentend as a command.
abstract class MPCommand {
  late final String description;
  MPUndoRedoCommand? oppositeCommand;

  MPCommand.forCWJM({required this.description, required this.oppositeCommand});

  MPCommand({required this.description});

  MPCommandType get type;

  MPCommand copyWith({
    required String description,
    required MPUndoRedoCommand oppositeCommand,
  });

  MPUndoRedoCommand execute(THFileStore thFileStore) {
    oppositeCommand = createOppositeCommand();
    actualExecute(thFileStore);

    return oppositeCommand!;
  }

  /// The description for the undo/redo command should be the description of
  /// the original command so the message on undo and redo are the same even
  /// if the actual original and opposite commands are different.
  MPUndoRedoCommand createOppositeCommand();

  void actualExecute(THFileStore thFileStore);

  String toJson() {
    return jsonEncode(toMap());
  }

  Map<String, dynamic> toMap();

  static MPCommand fromJson(String jsonString) {
    return fromMap(jsonDecode(jsonString));
  }

  static MPCommand fromMap(Map<String, dynamic> map) {
    switch (MPCommandType.values.byName(map['commandType'])) {
      case MPCommandType.moveBezierLineSegment:
        return MPMoveBezierLineSegmentCommand.fromMap(map);
      case MPCommandType.moveLine:
        return MPMoveLineCommand.fromMap(map);
      case MPCommandType.movePoint:
        return MPMovePointCommand.fromMap(map);
      case MPCommandType.moveStraightLineSegment:
        return MPMoveStraightLineSegmentCommand.fromMap(map);
    }
  }
}
