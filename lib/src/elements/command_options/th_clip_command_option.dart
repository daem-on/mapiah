import 'dart:collection';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:mapiah/src/elements/th_area.dart';
import 'package:mapiah/src/elements/command_options/th_multiple_choice_command_option.dart';
import 'package:mapiah/src/elements/th_element.dart';
import 'package:mapiah/src/elements/th_has_options.dart';
import 'package:mapiah/src/elements/th_line.dart';
import 'package:mapiah/src/elements/th_point.dart';
import 'package:mapiah/src/exceptions/th_custom_exception.dart';

part 'th_clip_command_option.mapper.dart';

@MappableClass()
class THClipCommandOption extends THMultipleChoiceCommandOption
    with THClipCommandOptionMappable {
  static const _thisOptionType = 'clip';
  static final HashSet<String> _unsupportedPointTypes = HashSet<String>.from({
    'altitude',
    'date',
    'height',
    'label',
    'passage-height',
    'remark',
    'station-name',
    'station',
  });

  /// Constructor necessary for dart_mappable support.
  THClipCommandOption.withExplicitParameters(
      super.thFile, super.parentMapiahID, super.optionType, super.choice)
      : super.withExplicitProperties() {
    _checkOptionParent();
  }

  THClipCommandOption(super.optionParent, super.optionType, super.choice) {
    _checkOptionParent();
  }

  THClipCommandOption.fromChoice(THHasOptions optionParent, String choice)
      : super(optionParent, _thisOptionType, choice) {
    _checkOptionParent();
  }

  void _checkOptionParent() {
    /// The -clip option is supported only for some point types.
    if (optionParent is THPoint) {
      final THPoint parentPoint = optionParent as THPoint;
      if (_unsupportedPointTypes.contains(parentPoint.plaType)) {
        throw THCustomException(
            "Unsupported point type '${parentPoint.plaType}' 'clip' option.");
      }

      /// But it is supported for all line and area types.
    } else if ((optionParent is! THLine) && (optionParent is! THArea)) {
      throw THCustomException(
          "Unsupported parent command type '${optionParent.elementType}' for 'clip' option.");
    }
  }
}
