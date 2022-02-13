import 'package:flutter/material.dart';
import 'package:web_buttons/src/web_button_optional_fields.dart';
import 'package:web_buttons/src/web_button.dart';

class Test {
var button = WebButton.simple('Hello', onPressed: (){}, optionalFields: WebButtonOptionalFields(fontSize: 18, fontFamily: 'Arial'));

testing() {
  debugPrint(button.optionalFields.fontSize.toString());
  // debugPrint(button.button.toString());
}
}

void main () {
  Test().testing();
}