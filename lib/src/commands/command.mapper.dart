// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'command.dart';

class CommandMapper extends ClassMapperBase<Command> {
  CommandMapper._();

  static CommandMapper? _instance;
  static CommandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandMapper._());
      MovePointCommandMapper.ensureInitialized();
      CommandTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Command';

  static CommandType _$_type(Command v) => v._type;
  static const Field<Command, CommandType> _f$_type =
      Field('_type', _$_type, key: 'type');
  static String _$_description(Command v) => v._description;
  static const Field<Command, String> _f$_description =
      Field('_description', _$_description, key: 'description');
  static UndoRedoCommand _$_undoRedo(Command v) => v._undoRedo;
  static const Field<Command, UndoRedoCommand> _f$_undoRedo =
      Field('_undoRedo', _$_undoRedo, key: 'undoRedo');

  @override
  final MappableFields<Command> fields = const {
    #_type: _f$_type,
    #_description: _f$_description,
    #_undoRedo: _f$_undoRedo,
  };

  static Command _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Command');
  }

  @override
  final Function instantiate = _instantiate;

  static Command fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Command>(map);
  }

  static Command fromJson(String json) {
    return ensureInitialized().decodeJson<Command>(json);
  }
}

mixin CommandMappable {
  String toJson();
  Map<String, dynamic> toMap();
  CommandCopyWith<Command, Command, Command> get copyWith;
}

abstract class CommandCopyWith<$R, $In extends Command, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({CommandType? type, String? description, UndoRedoCommand? undoRedo});
  CommandCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CommandTypeMapper extends EnumMapper<CommandType> {
  CommandTypeMapper._();

  static CommandTypeMapper? _instance;
  static CommandTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandTypeMapper._());
    }
    return _instance!;
  }

  static CommandType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CommandType decode(dynamic value) {
    switch (value) {
      case 'movePoint':
        return CommandType.movePoint;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CommandType self) {
    switch (self) {
      case CommandType.movePoint:
        return 'movePoint';
    }
  }
}

extension CommandTypeMapperExtension on CommandType {
  String toValue() {
    CommandTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CommandType>(this) as String;
  }
}

class MovePointCommandMapper extends ClassMapperBase<MovePointCommand> {
  MovePointCommandMapper._();

  static MovePointCommandMapper? _instance;
  static MovePointCommandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MovePointCommandMapper._());
      CommandMapper.ensureInitialized();
      CommandTypeMapper.ensureInitialized();
      THPointPositionPartMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MovePointCommand';

  static CommandType _$_type(MovePointCommand v) => v._type;
  static const Field<MovePointCommand, CommandType> _f$_type =
      Field('_type', _$_type, key: 'type');
  static String _$_description(MovePointCommand v) => v._description;
  static const Field<MovePointCommand, String> _f$_description =
      Field('_description', _$_description, key: 'description');
  static UndoRedoCommand _$_undoRedo(MovePointCommand v) => v._undoRedo;
  static const Field<MovePointCommand, UndoRedoCommand> _f$_undoRedo =
      Field('_undoRedo', _$_undoRedo, key: 'oppositeCommandJson');
  static int _$_pointMapiahID(MovePointCommand v) => v._pointMapiahID;
  static const Field<MovePointCommand, int> _f$_pointMapiahID =
      Field('_pointMapiahID', _$_pointMapiahID, key: 'pointMapiahID');
  static THPointPositionPart _$_newPosition(MovePointCommand v) =>
      v._newPosition;
  static const Field<MovePointCommand, THPointPositionPart> _f$_newPosition =
      Field('_newPosition', _$_newPosition, key: 'newPosition');

  @override
  final MappableFields<MovePointCommand> fields = const {
    #_type: _f$_type,
    #_description: _f$_description,
    #_undoRedo: _f$_undoRedo,
    #_pointMapiahID: _f$_pointMapiahID,
    #_newPosition: _f$_newPosition,
  };

  static MovePointCommand _instantiate(DecodingData data) {
    return MovePointCommand.withDescription(
        data.dec(_f$_type),
        data.dec(_f$_description),
        data.dec(_f$_undoRedo),
        data.dec(_f$_pointMapiahID),
        data.dec(_f$_newPosition));
  }

  @override
  final Function instantiate = _instantiate;

  static MovePointCommand fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MovePointCommand>(map);
  }

  static MovePointCommand fromJson(String json) {
    return ensureInitialized().decodeJson<MovePointCommand>(json);
  }
}

mixin MovePointCommandMappable {
  String toJson() {
    return MovePointCommandMapper.ensureInitialized()
        .encodeJson<MovePointCommand>(this as MovePointCommand);
  }

  Map<String, dynamic> toMap() {
    return MovePointCommandMapper.ensureInitialized()
        .encodeMap<MovePointCommand>(this as MovePointCommand);
  }

  MovePointCommandCopyWith<MovePointCommand, MovePointCommand, MovePointCommand>
      get copyWith => _MovePointCommandCopyWithImpl(
          this as MovePointCommand, $identity, $identity);
  @override
  String toString() {
    return MovePointCommandMapper.ensureInitialized()
        .stringifyValue(this as MovePointCommand);
  }

  @override
  bool operator ==(Object other) {
    return MovePointCommandMapper.ensureInitialized()
        .equalsValue(this as MovePointCommand, other);
  }

  @override
  int get hashCode {
    return MovePointCommandMapper.ensureInitialized()
        .hashValue(this as MovePointCommand);
  }
}

extension MovePointCommandValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MovePointCommand, $Out> {
  MovePointCommandCopyWith<$R, MovePointCommand, $Out>
      get $asMovePointCommand =>
          $base.as((v, t, t2) => _MovePointCommandCopyWithImpl(v, t, t2));
}

abstract class MovePointCommandCopyWith<$R, $In extends MovePointCommand, $Out>
    implements CommandCopyWith<$R, $In, $Out> {
  THPointPositionPartCopyWith<$R, THPointPositionPart, THPointPositionPart>
      get _newPosition;
  @override
  $R call(
      {CommandType? type,
      String? description,
      UndoRedoCommand? undoRedo,
      int? pointMapiahID,
      THPointPositionPart? newPosition});
  MovePointCommandCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MovePointCommandCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MovePointCommand, $Out>
    implements MovePointCommandCopyWith<$R, MovePointCommand, $Out> {
  _MovePointCommandCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MovePointCommand> $mapper =
      MovePointCommandMapper.ensureInitialized();
  @override
  THPointPositionPartCopyWith<$R, THPointPositionPart, THPointPositionPart>
      get _newPosition =>
          $value._newPosition.copyWith.$chain((v) => call(newPosition: v));
  @override
  $R call(
          {CommandType? type,
          String? description,
          UndoRedoCommand? undoRedo,
          int? pointMapiahID,
          THPointPositionPart? newPosition}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (description != null) #description: description,
        if (undoRedo != null) #undoRedo: undoRedo,
        if (pointMapiahID != null) #pointMapiahID: pointMapiahID,
        if (newPosition != null) #newPosition: newPosition
      }));
  @override
  MovePointCommand $make(CopyWithData data) => MovePointCommand.withDescription(
      data.get(#type, or: $value._type),
      data.get(#description, or: $value._description),
      data.get(#undoRedo, or: $value._undoRedo),
      data.get(#pointMapiahID, or: $value._pointMapiahID),
      data.get(#newPosition, or: $value._newPosition));

  @override
  MovePointCommandCopyWith<$R2, MovePointCommand, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MovePointCommandCopyWithImpl($value, $cast, t);
}
