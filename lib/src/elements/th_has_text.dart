import 'package:mapiah/src/elements/command_options/th_command_option.dart';
import 'package:mapiah/src/elements/parts/th_string_part.dart';

mixin THHasText on THCommandOption {
  final _text = THStringPart();

  set text(String aText) {
    _text.content = aText;
  }

  String get text {
    return _text.content;
  }

  String textToFile() {
    return _text.toFile();
  }
}
