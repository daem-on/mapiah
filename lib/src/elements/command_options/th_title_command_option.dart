import 'dart:convert';

import 'package:mapiah/src/elements/command_options/th_command_option.dart';

// title <string> . description of the object
class THTitleCommandOption extends THCommandOption {
  final String title;

  THTitleCommandOption({
    required super.parentMapiahID,
    required this.title,
  }) : super();

  THTitleCommandOption.addToOptionParent({
    required super.optionParent,
    required this.title,
  }) : super.addToOptionParent();

  @override
  THCommandOptionType get optionType => THCommandOptionType.title;

  @override
  Map<String, dynamic> toMap() {
    return {
      'parentMapiahID': parentMapiahID,
      'title': title,
    };
  }

  factory THTitleCommandOption.fromMap(Map<String, dynamic> map) {
    return THTitleCommandOption(
      parentMapiahID: map['parentMapiahID'],
      title: map['title'],
    );
  }

  factory THTitleCommandOption.fromJson(String jsonString) {
    return THTitleCommandOption.fromMap(jsonDecode(jsonString));
  }

  @override
  THTitleCommandOption copyWith({
    int? parentMapiahID,
    String? title,
  }) {
    return THTitleCommandOption(
      parentMapiahID: parentMapiahID ?? this.parentMapiahID,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(covariant THTitleCommandOption other) {
    if (identical(this, other)) return true;

    return other.parentMapiahID == parentMapiahID && other.title == title;
  }

  @override
  int get hashCode => Object.hash(
        parentMapiahID,
        title,
      );

  @override
  String specToFile() {
    return title;
  }
}
