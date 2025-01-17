// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'th_station_names_command_option.dart';

class THStationNamesCommandOptionMapper
    extends ClassMapperBase<THStationNamesCommandOption> {
  THStationNamesCommandOptionMapper._();

  static THStationNamesCommandOptionMapper? _instance;
  static THStationNamesCommandOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = THStationNamesCommandOptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'THStationNamesCommandOption';

  static int _$parentMapiahID(THStationNamesCommandOption v) =>
      v.parentMapiahID;
  static dynamic _arg$parentMapiahID(f) => f<int>();
  static const Field<THStationNamesCommandOption, dynamic> _f$parentMapiahID =
      Field('parentMapiahID', _$parentMapiahID, arg: _arg$parentMapiahID);
  static String _$optionType(THStationNamesCommandOption v) => v.optionType;
  static dynamic _arg$optionType(f) => f<String>();
  static const Field<THStationNamesCommandOption, dynamic> _f$optionType =
      Field('optionType', _$optionType, arg: _arg$optionType);
  static String _$preffix(THStationNamesCommandOption v) => v.preffix;
  static const Field<THStationNamesCommandOption, String> _f$preffix =
      Field('preffix', _$preffix);
  static String _$suffix(THStationNamesCommandOption v) => v.suffix;
  static const Field<THStationNamesCommandOption, String> _f$suffix =
      Field('suffix', _$suffix);

  @override
  final MappableFields<THStationNamesCommandOption> fields = const {
    #parentMapiahID: _f$parentMapiahID,
    #optionType: _f$optionType,
    #preffix: _f$preffix,
    #suffix: _f$suffix,
  };

  static THStationNamesCommandOption _instantiate(DecodingData data) {
    return THStationNamesCommandOption.withExplicitParameters(
        data.dec(_f$parentMapiahID),
        data.dec(_f$optionType),
        data.dec(_f$preffix),
        data.dec(_f$suffix));
  }

  @override
  final Function instantiate = _instantiate;

  static THStationNamesCommandOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<THStationNamesCommandOption>(map);
  }

  static THStationNamesCommandOption fromJson(String json) {
    return ensureInitialized().decodeJson<THStationNamesCommandOption>(json);
  }
}

mixin THStationNamesCommandOptionMappable {
  String toJson() {
    return THStationNamesCommandOptionMapper.ensureInitialized()
        .encodeJson<THStationNamesCommandOption>(
            this as THStationNamesCommandOption);
  }

  Map<String, dynamic> toMap() {
    return THStationNamesCommandOptionMapper.ensureInitialized()
        .encodeMap<THStationNamesCommandOption>(
            this as THStationNamesCommandOption);
  }

  THStationNamesCommandOptionCopyWith<THStationNamesCommandOption,
          THStationNamesCommandOption, THStationNamesCommandOption>
      get copyWith => _THStationNamesCommandOptionCopyWithImpl(
          this as THStationNamesCommandOption, $identity, $identity);
  @override
  String toString() {
    return THStationNamesCommandOptionMapper.ensureInitialized()
        .stringifyValue(this as THStationNamesCommandOption);
  }

  @override
  bool operator ==(Object other) {
    return THStationNamesCommandOptionMapper.ensureInitialized()
        .equalsValue(this as THStationNamesCommandOption, other);
  }

  @override
  int get hashCode {
    return THStationNamesCommandOptionMapper.ensureInitialized()
        .hashValue(this as THStationNamesCommandOption);
  }
}

extension THStationNamesCommandOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, THStationNamesCommandOption, $Out> {
  THStationNamesCommandOptionCopyWith<$R, THStationNamesCommandOption, $Out>
      get $asTHStationNamesCommandOption => $base
          .as((v, t, t2) => _THStationNamesCommandOptionCopyWithImpl(v, t, t2));
}

abstract class THStationNamesCommandOptionCopyWith<
    $R,
    $In extends THStationNamesCommandOption,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {dynamic parentMapiahID,
      dynamic optionType,
      String? preffix,
      String? suffix});
  THStationNamesCommandOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _THStationNamesCommandOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, THStationNamesCommandOption, $Out>
    implements
        THStationNamesCommandOptionCopyWith<$R, THStationNamesCommandOption,
            $Out> {
  _THStationNamesCommandOptionCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<THStationNamesCommandOption> $mapper =
      THStationNamesCommandOptionMapper.ensureInitialized();
  @override
  $R call(
          {Object? parentMapiahID = $none,
          Object? optionType = $none,
          String? preffix,
          String? suffix}) =>
      $apply(FieldCopyWithData({
        if (parentMapiahID != $none) #parentMapiahID: parentMapiahID,
        if (optionType != $none) #optionType: optionType,
        if (preffix != null) #preffix: preffix,
        if (suffix != null) #suffix: suffix
      }));
  @override
  THStationNamesCommandOption $make(CopyWithData data) =>
      THStationNamesCommandOption.withExplicitParameters(
          data.get(#parentMapiahID, or: $value.parentMapiahID),
          data.get(#optionType, or: $value.optionType),
          data.get(#preffix, or: $value.preffix),
          data.get(#suffix, or: $value.suffix));

  @override
  THStationNamesCommandOptionCopyWith<$R2, THStationNamesCommandOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _THStationNamesCommandOptionCopyWithImpl($value, $cast, t);
}
