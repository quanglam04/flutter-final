import 'package:easy_localization/easy_localization.dart';

import 'error_entity.dart';

class ValidationErrorEntity extends ErrorEntity {
  ValidationErrorEntity({required this.key, required super.message});

  final dynamic key;
}

class FieldEmptyErrorEntity extends ValidationErrorEntity {
  FieldEmptyErrorEntity({String? key, String? message})
      : super(
          key: key ?? '',
          message: message ?? 'error.field_is_required'.tr(),
        );
}

class EmailInvalidErrorEntity extends ValidationErrorEntity {
  EmailInvalidErrorEntity({String? key, String? message})
      : super(
          key: key ?? '',
          message: message ?? 'error.not_a_valid_e_mail_address'.tr(),
        );
}

class UidInvalidErrorEntity extends ValidationErrorEntity {
  UidInvalidErrorEntity({String? key, String? message})
      : super(
          key: key ?? '',
          message: message ?? 'error.uid_invalid'.tr(),
        );
}

class ErrorInvalidErrorEntity extends ValidationErrorEntity {
  ErrorInvalidErrorEntity({String? key, String? message})
      : super(
          key: key ?? '',
          message: message ?? 'error.message'.tr(),
        );
}
