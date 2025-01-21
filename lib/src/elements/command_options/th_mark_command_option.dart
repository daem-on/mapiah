import 'dart:convert';

import 'package:mapiah/src/elements/command_options/th_command_option.dart';

// mark <keyword> . is used to mark the point on the line (see join command).
class THMarkCommandOption extends THCommandOption {
  late final String mark;

  THMarkCommandOption({
    required super.parentMapiahID,
    required this.mark,
  }) : super();

  THMarkCommandOption.addToOptionParent({
    required super.optionParent,
    required this.mark,
  }) : super.addToOptionParent();

  @override
  THCommandOptionType get optionType => THCommandOptionType.mark;

  @override
  Map<String, dynamic> toMap() {
    return {
      'parentMapiahID': parentMapiahID,
      'mark': mark,
    };
  }

  factory THMarkCommandOption.fromMap(Map<String, dynamic> map) {
    return THMarkCommandOption(
      parentMapiahID: map['parentMapiahID'],
      mark: map['mark'],
    );
  }

  factory THMarkCommandOption.fromJson(String jsonString) {
    return THMarkCommandOption.fromMap(jsonDecode(jsonString));
  }

  @override
  THMarkCommandOption copyWith({
    int? parentMapiahID,
    String? mark,
  }) {
    return THMarkCommandOption(
      parentMapiahID: parentMapiahID ?? this.parentMapiahID,
      mark: mark ?? this.mark,
    );
  }

  @override
  bool operator ==(covariant THMarkCommandOption other) {
    if (identical(this, other)) return true;

    return other.parentMapiahID == parentMapiahID && other.mark == mark;
  }

  @override
  int get hashCode => Object.hash(
        parentMapiahID,
        mark,
      );

  // set mark(String aMark) {
  //   if (!thKeywordRegex.hasMatch(aMark)) {
  //     throw THCustomException(
  //         "Invalid mark '$aMark'. A mark must be a keyword.");
  //   }
  //   _mark = aMark;
  // }

  @override
  String specToFile() {
    return mark;
  }
}
