// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'th_orientation_command_option.dart';

class THOrientationCommandOptionMapper
    extends ClassMapperBase<THOrientationCommandOption> {
  THOrientationCommandOptionMapper._();

  static THOrientationCommandOptionMapper? _instance;
  static THOrientationCommandOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = THOrientationCommandOptionMapper._());
      THCommandOptionMapper.ensureInitialized();
      THFileMapper.ensureInitialized();
      THDoublePartMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'THOrientationCommandOption';

  static THFile _$thFile(THOrientationCommandOption v) => v.thFile;
  static const Field<THOrientationCommandOption, THFile> _f$thFile =
      Field('thFile', _$thFile);
  static int _$parentMapiahID(THOrientationCommandOption v) => v.parentMapiahID;
  static const Field<THOrientationCommandOption, int> _f$parentMapiahID =
      Field('parentMapiahID', _$parentMapiahID);
  static String _$optionType(THOrientationCommandOption v) => v.optionType;
  static const Field<THOrientationCommandOption, String> _f$optionType =
      Field('optionType', _$optionType);
  static THDoublePart _$azimuth(THOrientationCommandOption v) => v.azimuth;
  static const Field<THOrientationCommandOption, THDoublePart> _f$azimuth =
      Field('azimuth', _$azimuth);

  @override
  final MappableFields<THOrientationCommandOption> fields = const {
    #thFile: _f$thFile,
    #parentMapiahID: _f$parentMapiahID,
    #optionType: _f$optionType,
    #azimuth: _f$azimuth,
  };

  static THOrientationCommandOption _instantiate(DecodingData data) {
    return THOrientationCommandOption.withExplicitOptionType(
        data.dec(_f$thFile),
        data.dec(_f$parentMapiahID),
        data.dec(_f$optionType),
        data.dec(_f$azimuth));
  }

  @override
  final Function instantiate = _instantiate;

  static THOrientationCommandOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<THOrientationCommandOption>(map);
  }

  static THOrientationCommandOption fromJson(String json) {
    return ensureInitialized().decodeJson<THOrientationCommandOption>(json);
  }
}

mixin THOrientationCommandOptionMappable {
  String toJson() {
    return THOrientationCommandOptionMapper.ensureInitialized()
        .encodeJson<THOrientationCommandOption>(
            this as THOrientationCommandOption);
  }

  Map<String, dynamic> toMap() {
    return THOrientationCommandOptionMapper.ensureInitialized()
        .encodeMap<THOrientationCommandOption>(
            this as THOrientationCommandOption);
  }

  THOrientationCommandOptionCopyWith<THOrientationCommandOption,
          THOrientationCommandOption, THOrientationCommandOption>
      get copyWith => _THOrientationCommandOptionCopyWithImpl(
          this as THOrientationCommandOption, $identity, $identity);
  @override
  String toString() {
    return THOrientationCommandOptionMapper.ensureInitialized()
        .stringifyValue(this as THOrientationCommandOption);
  }

  @override
  bool operator ==(Object other) {
    return THOrientationCommandOptionMapper.ensureInitialized()
        .equalsValue(this as THOrientationCommandOption, other);
  }

  @override
  int get hashCode {
    return THOrientationCommandOptionMapper.ensureInitialized()
        .hashValue(this as THOrientationCommandOption);
  }
}

extension THOrientationCommandOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, THOrientationCommandOption, $Out> {
  THOrientationCommandOptionCopyWith<$R, THOrientationCommandOption, $Out>
      get $asTHOrientationCommandOption => $base
          .as((v, t, t2) => _THOrientationCommandOptionCopyWithImpl(v, t, t2));
}

abstract class THOrientationCommandOptionCopyWith<
    $R,
    $In extends THOrientationCommandOption,
    $Out> implements THCommandOptionCopyWith<$R, $In, $Out> {
  @override
  THFileCopyWith<$R, THFile, THFile> get thFile;
  THDoublePartCopyWith<$R, THDoublePart, THDoublePart> get azimuth;
  @override
  $R call(
      {THFile? thFile,
      int? parentMapiahID,
      String? optionType,
      THDoublePart? azimuth});
  THOrientationCommandOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _THOrientationCommandOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, THOrientationCommandOption, $Out>
    implements
        THOrientationCommandOptionCopyWith<$R, THOrientationCommandOption,
            $Out> {
  _THOrientationCommandOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<THOrientationCommandOption> $mapper =
      THOrientationCommandOptionMapper.ensureInitialized();
  @override
  THFileCopyWith<$R, THFile, THFile> get thFile =>
      $value.thFile.copyWith.$chain((v) => call(thFile: v));
  @override
  THDoublePartCopyWith<$R, THDoublePart, THDoublePart> get azimuth =>
      $value.azimuth.copyWith.$chain((v) => call(azimuth: v));
  @override
  $R call(
          {THFile? thFile,
          int? parentMapiahID,
          String? optionType,
          THDoublePart? azimuth}) =>
      $apply(FieldCopyWithData({
        if (thFile != null) #thFile: thFile,
        if (parentMapiahID != null) #parentMapiahID: parentMapiahID,
        if (optionType != null) #optionType: optionType,
        if (azimuth != null) #azimuth: azimuth
      }));
  @override
  THOrientationCommandOption $make(CopyWithData data) =>
      THOrientationCommandOption.withExplicitOptionType(
          data.get(#thFile, or: $value.thFile),
          data.get(#parentMapiahID, or: $value.parentMapiahID),
          data.get(#optionType, or: $value.optionType),
          data.get(#azimuth, or: $value.azimuth));

  @override
  THOrientationCommandOptionCopyWith<$R2, THOrientationCommandOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _THOrientationCommandOptionCopyWithImpl($value, $cast, t);
}
