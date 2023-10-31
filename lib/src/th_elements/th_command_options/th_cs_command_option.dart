import 'package:mapiah/src/th_elements/th_command_options/th_command_option.dart';
import 'package:mapiah/src/th_elements/th_parts/th_cs_part.dart';

class THCSCommandOption extends THCommandOption {
  late THCSPart cs;

  THCSCommandOption(super.parent, String aCSString, bool forOutputOnly) {
    cs = THCSPart(aCSString, forOutputOnly);
  }

  @override
  String get optionType {
    return 'cs';
  }

  @override
  String specToFile() {
    return cs.toString();
  }
}
