import 'package:dart_mappable/dart_mappable.dart';
import 'package:mapiah/src/elements/command_options/th_command_option.dart';
import 'package:mapiah/src/elements/th_element.dart';
import 'package:mapiah/src/elements/th_has_options.dart';
import 'package:mapiah/src/elements/th_line.dart';
import 'package:mapiah/src/elements/parts/th_double_part.dart';
import 'package:mapiah/src/exceptions/th_custom_exception.dart';

part 'th_lsize_command_option.mapper.dart';

// l-size <number> . Size of the line (to the left). Only valid on and required for slope
// type.
//
// size <number> . synonym of l-size
@MappableClass()
class THLSizeCommandOption extends THCommandOption
    with THLSizeCommandOptionMappable {
  static const String _thisOptionType = 'l-size';
  late THDoublePart number;

  /// Constructor necessary for dart_mappable support.
  THLSizeCommandOption.withExplicitOptionType(
      super.thFile, super.parentMapiahID, super.optionType, this.number)
      : super.withExplicitProperties() {
    _checkOptionParent();
  }

  THLSizeCommandOption.fromString(THHasOptions optionParent, String aNumber)
      : super(optionParent, _thisOptionType) {
    _checkOptionParent();
    number = THDoublePart.fromString(aNumber);
  }

  void _checkOptionParent() {
    if ((optionParent.parent is! THLine) ||
        ((optionParent.parent as THLine).plaType != 'slope')) {
      throw THCustomException(
          "'l-size' option only supported for 'slope' lines.");
    }
  }

  @override
  String specToFile() {
    return number.toString();
  }
}
