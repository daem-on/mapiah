import 'package:mapiah/src/th_elements/th_command_options/th_command_option.dart';
import 'package:mapiah/src/th_elements/th_command_options/th_has_length.dart';
import 'package:mapiah/src/th_elements/th_parts/th_double_part.dart';
import 'package:mapiah/src/th_elements/th_point.dart';
import 'package:mapiah/src/th_exceptions/th_custom_exception.dart';

class THDistCommandOption extends THCommandOption with THHasLength {
  THDistCommandOption(super.parentOption, THDoublePart aDistance,
      [String? aUnit]) {
    if ((parentOption is! THPoint) ||
        ((parentOption as THPoint).pointType != 'extra')) {
      throw THCustomException(
          "'dist' command option only supported on points of type 'extra'.");
    }
    distance = aDistance;
    if (aUnit != null) {
      unitFromString(aUnit);
    }
  }

  THDistCommandOption.fromString(super.parentOption, String aDistance,
      [String? aUnit]) {
    if ((parentOption is! THPoint) ||
        ((parentOption as THPoint).pointType != 'extra')) {
      throw THCustomException(
          "'dist' command option only supported on points of type 'extra'.");
    }
    distance = THDoublePart.fromString(aDistance);
    if (aUnit != null) {
      unitFromString(aUnit);
    }
  }

  @override
  String get optionType => 'dist';
}
