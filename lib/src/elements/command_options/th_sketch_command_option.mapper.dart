// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'th_sketch_command_option.dart';

class THSketchCommandOptionMapper
    extends ClassMapperBase<THSketchCommandOption> {
  THSketchCommandOptionMapper._();

  static THSketchCommandOptionMapper? _instance;
  static THSketchCommandOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = THSketchCommandOptionMapper._());
      THCommandOptionMapper.ensureInitialized();
      THFileMapper.ensureInitialized();
      THPointPositionPartMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'THSketchCommandOption';

  static THFile _$thFile(THSketchCommandOption v) => v.thFile;
  static const Field<THSketchCommandOption, THFile> _f$thFile =
      Field('thFile', _$thFile);
  static int _$parentMapiahID(THSketchCommandOption v) => v.parentMapiahID;
  static const Field<THSketchCommandOption, int> _f$parentMapiahID =
      Field('parentMapiahID', _$parentMapiahID);
  static String _$optionType(THSketchCommandOption v) => v.optionType;
  static const Field<THSketchCommandOption, String> _f$optionType =
      Field('optionType', _$optionType);
  static String _$filename(THSketchCommandOption v) => v.filename;
  static const Field<THSketchCommandOption, String> _f$filename =
      Field('filename', _$filename);
  static THPointPositionPart _$point(THSketchCommandOption v) => v.point;
  static const Field<THSketchCommandOption, THPointPositionPart> _f$point =
      Field('point', _$point);

  @override
  final MappableFields<THSketchCommandOption> fields = const {
    #thFile: _f$thFile,
    #parentMapiahID: _f$parentMapiahID,
    #optionType: _f$optionType,
    #filename: _f$filename,
    #point: _f$point,
  };

  static THSketchCommandOption _instantiate(DecodingData data) {
    return THSketchCommandOption.withExplicitOptionType(
        data.dec(_f$thFile),
        data.dec(_f$parentMapiahID),
        data.dec(_f$optionType),
        data.dec(_f$filename),
        data.dec(_f$point));
  }

  @override
  final Function instantiate = _instantiate;

  static THSketchCommandOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<THSketchCommandOption>(map);
  }

  static THSketchCommandOption fromJson(String json) {
    return ensureInitialized().decodeJson<THSketchCommandOption>(json);
  }
}

mixin THSketchCommandOptionMappable {
  String toJson() {
    return THSketchCommandOptionMapper.ensureInitialized()
        .encodeJson<THSketchCommandOption>(this as THSketchCommandOption);
  }

  Map<String, dynamic> toMap() {
    return THSketchCommandOptionMapper.ensureInitialized()
        .encodeMap<THSketchCommandOption>(this as THSketchCommandOption);
  }

  THSketchCommandOptionCopyWith<THSketchCommandOption, THSketchCommandOption,
          THSketchCommandOption>
      get copyWith => _THSketchCommandOptionCopyWithImpl(
          this as THSketchCommandOption, $identity, $identity);
  @override
  String toString() {
    return THSketchCommandOptionMapper.ensureInitialized()
        .stringifyValue(this as THSketchCommandOption);
  }

  @override
  bool operator ==(Object other) {
    return THSketchCommandOptionMapper.ensureInitialized()
        .equalsValue(this as THSketchCommandOption, other);
  }

  @override
  int get hashCode {
    return THSketchCommandOptionMapper.ensureInitialized()
        .hashValue(this as THSketchCommandOption);
  }
}

extension THSketchCommandOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, THSketchCommandOption, $Out> {
  THSketchCommandOptionCopyWith<$R, THSketchCommandOption, $Out>
      get $asTHSketchCommandOption =>
          $base.as((v, t, t2) => _THSketchCommandOptionCopyWithImpl(v, t, t2));
}

abstract class THSketchCommandOptionCopyWith<
    $R,
    $In extends THSketchCommandOption,
    $Out> implements THCommandOptionCopyWith<$R, $In, $Out> {
  @override
  THFileCopyWith<$R, THFile, THFile> get thFile;
  THPointPositionPartCopyWith<$R, THPointPositionPart, THPointPositionPart>
      get point;
  @override
  $R call(
      {THFile? thFile,
      int? parentMapiahID,
      String? optionType,
      String? filename,
      THPointPositionPart? point});
  THSketchCommandOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _THSketchCommandOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, THSketchCommandOption, $Out>
    implements THSketchCommandOptionCopyWith<$R, THSketchCommandOption, $Out> {
  _THSketchCommandOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<THSketchCommandOption> $mapper =
      THSketchCommandOptionMapper.ensureInitialized();
  @override
  THFileCopyWith<$R, THFile, THFile> get thFile =>
      $value.thFile.copyWith.$chain((v) => call(thFile: v));
  @override
  THPointPositionPartCopyWith<$R, THPointPositionPart, THPointPositionPart>
      get point => $value.point.copyWith.$chain((v) => call(point: v));
  @override
  $R call(
          {THFile? thFile,
          int? parentMapiahID,
          String? optionType,
          String? filename,
          THPointPositionPart? point}) =>
      $apply(FieldCopyWithData({
        if (thFile != null) #thFile: thFile,
        if (parentMapiahID != null) #parentMapiahID: parentMapiahID,
        if (optionType != null) #optionType: optionType,
        if (filename != null) #filename: filename,
        if (point != null) #point: point
      }));
  @override
  THSketchCommandOption $make(CopyWithData data) =>
      THSketchCommandOption.withExplicitOptionType(
          data.get(#thFile, or: $value.thFile),
          data.get(#parentMapiahID, or: $value.parentMapiahID),
          data.get(#optionType, or: $value.optionType),
          data.get(#filename, or: $value.filename),
          data.get(#point, or: $value.point));

  @override
  THSketchCommandOptionCopyWith<$R2, THSketchCommandOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _THSketchCommandOptionCopyWithImpl($value, $cast, t);
}
