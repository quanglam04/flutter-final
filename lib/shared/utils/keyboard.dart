import 'package:flutter/services.dart';

void showKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.show');
}

void hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
