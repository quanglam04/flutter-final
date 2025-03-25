import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/shared/extension/number.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(
        text: '0',
        selection: const TextSelection.collapsed(offset: 1),
      );
    }
    if (oldValue.text == '0' && oldValue.selection.baseOffset == 1) {
      final doubleValue = double.tryParse(newValue.text) ?? 0;
      return newValue.copyWith(
        text: doubleValue.toText(),
        selection: const TextSelection.collapsed(offset: 1),
      );
    }

    return newValue;
  }
}