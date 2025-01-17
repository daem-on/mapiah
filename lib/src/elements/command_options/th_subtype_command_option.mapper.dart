// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'th_subtype_command_option.dart';

class THSubtypeCommandOptionMapper
    extends ClassMapperBase<THSubtypeCommandOption> {
  THSubtypeCommandOptionMapper._();

  static THSubtypeCommandOptionMapper? _instance;
  static THSubtypeCommandOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = THSubtypeCommandOptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'THSubtypeCommandOption';

  static int _$parentMapiahID(THSubtypeCommandOption v) => v.parentMapiahID;
  static dynamic _arg$parentMapiahID(f) => f<int>();
  static const Field<THSubtypeCommandOption, dynamic> _f$parentMapiahID =
      Field('parentMapiahID', _$parentMapiahID, arg: _arg$parentMapiahID);
  static String _$optionType(THSubtypeCommandOption v) => v.optionType;
  static dynamic _arg$optionType(f) => f<String>();
  static const Field<THSubtypeCommandOption, dynamic> _f$optionType =
      Field('optionType', _$optionType, arg: _arg$optionType);
  static String _$subtype(THSubtypeCommandOption v) => v.subtype;
  static const Field<THSubtypeCommandOption, String> _f$subtype =
      Field('subtype', _$subtype);

  @override
  final MappableFields<THSubtypeCommandOption> fields = const {
    #parentMapiahID: _f$parentMapiahID,
    #optionType: _f$optionType,
    #subtype: _f$subtype,
  };

  static THSubtypeCommandOption _instantiate(DecodingData data) {
    return THSubtypeCommandOption.withExplicitParameters(
        data.dec(_f$parentMapiahID),
        data.dec(_f$optionType),
        data.dec(_f$subtype));
  }

  @override
  final Function instantiate = _instantiate;

  static THSubtypeCommandOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<THSubtypeCommandOption>(map);
  }

  static THSubtypeCommandOption fromJson(String json) {
    return ensureInitialized().decodeJson<THSubtypeCommandOption>(json);
  }
}

mixin THSubtypeCommandOptionMappable {
  String toJson() {
    return THSubtypeCommandOptionMapper.ensureInitialized()
        .encodeJson<THSubtypeCommandOption>(this as THSubtypeCommandOption);
  }

  Map<String, dynamic> toMap() {
    return THSubtypeCommandOptionMapper.ensureInitialized()
        .encodeMap<THSubtypeCommandOption>(this as THSubtypeCommandOption);
  }

  THSubtypeCommandOptionCopyWith<THSubtypeCommandOption, THSubtypeCommandOption,
          THSubtypeCommandOption>
      get copyWith => _THSubtypeCommandOptionCopyWithImpl(
          this as THSubtypeCommandOption, $identity, $identity);
  @override
  String toString() {
    return THSubtypeCommandOptionMapper.ensureInitialized()
        .stringifyValue(this as THSubtypeCommandOption);
  }

  @override
  bool operator ==(Object other) {
    return THSubtypeCommandOptionMapper.ensureInitialized()
        .equalsValue(this as THSubtypeCommandOption, other);
  }

  @override
  int get hashCode {
    return THSubtypeCommandOptionMapper.ensureInitialized()
        .hashValue(this as THSubtypeCommandOption);
  }
}

extension THSubtypeCommandOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, THSubtypeCommandOption, $Out> {
  THSubtypeCommandOptionCopyWith<$R, THSubtypeCommandOption, $Out>
      get $asTHSubtypeCommandOption =>
          $base.as((v, t, t2) => _THSubtypeCommandOptionCopyWithImpl(v, t, t2));
}

abstract class THSubtypeCommandOptionCopyWith<
    $R,
    $In extends THSubtypeCommandOption,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({dynamic parentMapiahID, dynamic optionType, String? subtype});
  THSubtypeCommandOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _THSubtypeCommandOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, THSubtypeCommandOption, $Out>
    implements
        THSubtypeCommandOptionCopyWith<$R, THSubtypeCommandOption, $Out> {
  _THSubtypeCommandOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<THSubtypeCommandOption> $mapper =
      THSubtypeCommandOptionMapper.ensureInitialized();
  @override
  $R call(
          {Object? parentMapiahID = $none,
          Object? optionType = $none,
          String? subtype}) =>
      $apply(FieldCopyWithData({
        if (parentMapiahID != $none) #parentMapiahID: parentMapiahID,
        if (optionType != $none) #optionType: optionType,
        if (subtype != null) #subtype: subtype
      }));
  @override
  THSubtypeCommandOption $make(CopyWithData data) =>
      THSubtypeCommandOption.withExplicitParameters(
          data.get(#parentMapiahID, or: $value.parentMapiahID),
          data.get(#optionType, or: $value.optionType),
          data.get(#subtype, or: $value.subtype));

  @override
  THSubtypeCommandOptionCopyWith<$R2, THSubtypeCommandOption, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _THSubtypeCommandOptionCopyWithImpl($value, $cast, t);
}
