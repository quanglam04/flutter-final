import 'package:flutter_clean_architecture/shared/extension/string.dart';

import '../constants.dart';
import 'error_entity/error_entity.dart';
import 'error_entity/validation_error_entity.dart';

class ValidationModel<V> {
  const ValidationModel(this.key, {this.value, this.error});

  final String key;
  final V? value;
  final String? error;

  ValidationModel<V> copyWith(V? value) {
    return ValidationModel(key, value: value);
  }

  ValidationModel<V> copyWithError(String? error) {
    return ValidationModel(key, value: value, error: error);
  }

  @override
  String toString() {
    return 'ValidationModel{key: $key, value: $value, error: $error}';
  }
}

extension ValidationModelExtension on ValidationModel {
  ErrorEntity? checkInputIsRequired() {
    if (value is String) {
      final stringValue = value as String;
      if (stringValue.isNullOrEmpty()) {
        return FieldEmptyErrorEntity(key: key);
      }
    } else if (value is List) {
      final list = value as List;
      if (list.isEmpty) {
        return FieldEmptyErrorEntity(key: key);
      }
    } else if (value == null) {
      return FieldEmptyErrorEntity(key: key);
    }
    return null;
  }

  ErrorEntity? checkInputIsValidEmail() {
    if (value is! String) {
      return null;
    }
    final stringValue = value as String;

    final isValid = RegExp(EMAIL_REGEX).hasMatch(stringValue);

    if (!isValid) {
      return EmailInvalidErrorEntity(key: key);
    }

    return null;
  }
}