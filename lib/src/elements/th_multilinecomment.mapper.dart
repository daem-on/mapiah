// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'th_multilinecomment.dart';

class THMultiLineCommentMapper extends ClassMapperBase<THMultiLineComment> {
  THMultiLineCommentMapper._();

  static THMultiLineCommentMapper? _instance;
  static THMultiLineCommentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = THMultiLineCommentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'THMultiLineComment';

  static int _$mapiahID(THMultiLineComment v) => v.mapiahID;
  static dynamic _arg$mapiahID(f) => f<int>();
  static const Field<THMultiLineComment, dynamic> _f$mapiahID =
      Field('mapiahID', _$mapiahID, arg: _arg$mapiahID);
  static int _$parentMapiahID(THMultiLineComment v) => v.parentMapiahID;
  static dynamic _arg$parentMapiahID(f) => f<int>();
  static const Field<THMultiLineComment, dynamic> _f$parentMapiahID =
      Field('parentMapiahID', _$parentMapiahID, arg: _arg$parentMapiahID);
  static String? _$sameLineComment(THMultiLineComment v) => v.sameLineComment;
  static dynamic _arg$sameLineComment(f) => f<String>();
  static const Field<THMultiLineComment, dynamic> _f$sameLineComment =
      Field('sameLineComment', _$sameLineComment, arg: _arg$sameLineComment);

  @override
  final MappableFields<THMultiLineComment> fields = const {
    #mapiahID: _f$mapiahID,
    #parentMapiahID: _f$parentMapiahID,
    #sameLineComment: _f$sameLineComment,
  };

  static THMultiLineComment _instantiate(DecodingData data) {
    return THMultiLineComment.notAddToParent(data.dec(_f$mapiahID),
        data.dec(_f$parentMapiahID), data.dec(_f$sameLineComment));
  }

  @override
  final Function instantiate = _instantiate;

  static THMultiLineComment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<THMultiLineComment>(map);
  }

  static THMultiLineComment fromJson(String json) {
    return ensureInitialized().decodeJson<THMultiLineComment>(json);
  }
}

mixin THMultiLineCommentMappable {
  String toJson() {
    return THMultiLineCommentMapper.ensureInitialized()
        .encodeJson<THMultiLineComment>(this as THMultiLineComment);
  }

  Map<String, dynamic> toMap() {
    return THMultiLineCommentMapper.ensureInitialized()
        .encodeMap<THMultiLineComment>(this as THMultiLineComment);
  }

  THMultiLineCommentCopyWith<THMultiLineComment, THMultiLineComment,
          THMultiLineComment>
      get copyWith => _THMultiLineCommentCopyWithImpl(
          this as THMultiLineComment, $identity, $identity);
  @override
  String toString() {
    return THMultiLineCommentMapper.ensureInitialized()
        .stringifyValue(this as THMultiLineComment);
  }

  @override
  bool operator ==(Object other) {
    return THMultiLineCommentMapper.ensureInitialized()
        .equalsValue(this as THMultiLineComment, other);
  }

  @override
  int get hashCode {
    return THMultiLineCommentMapper.ensureInitialized()
        .hashValue(this as THMultiLineComment);
  }
}

extension THMultiLineCommentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, THMultiLineComment, $Out> {
  THMultiLineCommentCopyWith<$R, THMultiLineComment, $Out>
      get $asTHMultiLineComment =>
          $base.as((v, t, t2) => _THMultiLineCommentCopyWithImpl(v, t, t2));
}

abstract class THMultiLineCommentCopyWith<$R, $In extends THMultiLineComment,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({dynamic mapiahID, dynamic parentMapiahID, dynamic sameLineComment});
  THMultiLineCommentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _THMultiLineCommentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, THMultiLineComment, $Out>
    implements THMultiLineCommentCopyWith<$R, THMultiLineComment, $Out> {
  _THMultiLineCommentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<THMultiLineComment> $mapper =
      THMultiLineCommentMapper.ensureInitialized();
  @override
  $R call(
          {Object? mapiahID = $none,
          Object? parentMapiahID = $none,
          Object? sameLineComment = $none}) =>
      $apply(FieldCopyWithData({
        if (mapiahID != $none) #mapiahID: mapiahID,
        if (parentMapiahID != $none) #parentMapiahID: parentMapiahID,
        if (sameLineComment != $none) #sameLineComment: sameLineComment
      }));
  @override
  THMultiLineComment $make(CopyWithData data) =>
      THMultiLineComment.notAddToParent(
          data.get(#mapiahID, or: $value.mapiahID),
          data.get(#parentMapiahID, or: $value.parentMapiahID),
          data.get(#sameLineComment, or: $value.sameLineComment));

  @override
  THMultiLineCommentCopyWith<$R2, THMultiLineComment, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _THMultiLineCommentCopyWithImpl($value, $cast, t);
}
