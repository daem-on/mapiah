import 'package:dart_mappable/dart_mappable.dart';
import 'package:mapiah/src/elements/command_options/th_command_option.dart';
import 'package:mapiah/src/elements/th_element.dart';
import 'package:mapiah/src/elements/th_has_options.dart';
import 'package:mapiah/src/exceptions/th_convert_from_list_exception.dart';
import 'package:mapiah/src/elements/parts/th_double_part.dart';
import 'package:mapiah/src/elements/parts/th_length_unit_part.dart';

part 'th_scrap_scale_command_option.mapper.dart';

// scale <specification> . is used to pre-scale (convert coordinates from pixels to
// meters) the scrap data. If scrap projection is none, this is the only transformation that
// is done with coordinates. The <specification> has four forms:
// 1. <number> . <number> meters per drawing unit.
// 2. [<number> <length units>] . <number> <length units> per drawing unit.
// 3. [<num1> <num2> <length units>] . <num1> drawing units corresponds to <num2>
// <length units> in reality.
// 4. [<num1> ... <num8> [<length units>]] . this is the most general format, where
// you specify, in order, the x and y coordinates of two points in the scrap and two points
// in reality. Optionally, you can also specify units for the coordinates of the ‘points in
// reality’. This form allows you to apply both scaling and rotation to the scrap.
@MappableClass()
class THScrapScaleCommandOption extends THCommandOption
    with THScrapScaleCommandOptionMappable {
  static const String _thisOptionType = 'scale';
  List<THDoublePart> _numericSpecifications;
  THLengthUnitPart? unit;

  /// Constructor necessary for dart_mappable support.
  THScrapScaleCommandOption.withExplicitOptionType(
      super.thFile,
      super.parentMapiahID,
      super.optionType,
      List<THDoublePart> numericSpecifications,
      [this.unit])
      : _numericSpecifications = numericSpecifications,
        super.withExplicitProperties();

  THScrapScaleCommandOption(
      THHasOptions optionParent, List<THDoublePart> numericSpecifications,
      [this.unit])
      : _numericSpecifications = numericSpecifications,
        super(optionParent, _thisOptionType);

  set numericSpecifications(List<THDoublePart> aList) {
    final int length = aList.length;

    if ((length != 1) && (length != 2) && (length != 8)) {
      throw THConvertFromListException('THScaleCommandOption', aList);
    }

    _numericSpecifications = aList;
  }

  @override
  String specToFile() {
    String asString = '';

    for (var aValue in _numericSpecifications) {
      asString += ' ${aValue.toString()}';
    }

    if (unit != null) {
      asString += ' ${unit.toString()}';
    }

    asString = asString.trim();

    if (asString.contains(' ')) {
      asString = '[ $asString ]';
    }

    return asString;
  }
}
