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
      THDoublePartMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'THOrientationCommandOption';

  static THHasOptions _$optionParent(THOrientationCommandOption v) =>
      v.optionParent;
  static const Field<THOrientationCommandOption, THHasOptions> _f$optionParent =
      Field('optionParent', _$optionParent);
  static THDoublePart _$azimuth(THOrientationCommandOption v) => v.azimuth;
  static const Field<THOrientationCommandOption, THDoublePart> _f$azimuth =
      Field('azimuth', _$azimuth);

  @override
  final MappableFields<THOrientationCommandOption> fields = const {
    #optionParent: _f$optionParent,
    #azimuth: _f$azimuth,
  };

  static THOrientationCommandOption _instantiate(DecodingData data) {
    return THOrientationCommandOption(
        data.dec(_f$optionParent), data.dec(_f$azimuth));
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
  THDoublePartCopyWith<$R, THDoublePart, THDoublePart> get azimuth;
  @override
  $R call({THHasOptions? optionParent, THDoublePart? azimuth});
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
  THDoublePartCopyWith<$R, THDoublePart, THDoublePart> get azimuth =>
      $value.azimuth.copyWith.$chain((v) => call(azimuth: v));
  @override
  $R call({THHasOptions? optionParent, THDoublePart? azimuth}) =>
      $apply(FieldCopyWithData({
        if (optionParent != null) #optionParent: optionParent,
        if (azimuth != null) #azimuth: azimuth
      }));
  @override
  THOrientationCommandOption $make(CopyWithData data) =>
      THOrientationCommandOption(
          data.get(#optionParent, or: $value.optionParent),
          data.get(#azimuth, or: $value.azimuth));

  @override
  THOrientationCommandOptionCopyWith<$R2, THOrientationCommandOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _THOrientationCommandOptionCopyWithImpl($value, $cast, t);
}