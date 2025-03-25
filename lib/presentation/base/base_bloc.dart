import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/shared/common/error_converter.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/validation_error_entity.dart';
import 'package:flutter_clean_architecture/shared/common/error_handler.dart';
import 'package:flutter_clean_architecture/shared/utils/alert.dart';

import 'base_state.dart';

abstract class BaseBloc<V, S extends BaseState> extends Bloc<V, S> {
  BaseBloc(S initialState) : super(initialState);

  void handlePageLoadFailed<S>(Emitter<S> emit, Object error) {
    final errorConvert = ErrorConverter.convert(error);
    if (errorConvert is SessionExpiredErrorEntity || errorConvert is UidInvalidErrorEntity) {
      ErrorHandler.handle(errorConvert);
    }
  }

  void handleError<S>(Emitter<S> emit, Object error) {
    ErrorHandler.handle(error);
  }

  Future showSuccessDialog(
    String message, {
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) async {
    await AppAlertDialog.show(
      message: message,
      type: AppAlertType.success,
      onConfirmBtnTap: onPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  Future showConfirmDialog(
    String message, {
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    await AppAlertDialog.show(
      message: message,
      type: AppAlertType.confirm,
      onConfirmBtnTap: onConfirm,
      onCancelBtnTap: onCancel,
    );
  }

  Future showAlertDialog(String message, {VoidCallback? onPressed}) async {
    await AppAlertDialog.show(
      message: message,
      type: AppAlertType.info,
      onConfirmBtnTap: onPressed,
    );
  }

  Future showErrorDialog(String message, {VoidCallback? onPressed}) {
    return AppAlertDialog.show(
      message: message,
      type: AppAlertType.error,
      onConfirmBtnTap: onPressed,
    );
  }

  void showLoading() {
    AppAlertDialog.show(
      type: AppAlertType.loading,
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    AppAlertDialog.hide();
  }
}