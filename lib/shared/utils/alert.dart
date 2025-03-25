import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/colors.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:one_context/one_context.dart';
enum AppAlertType { success, error, warning, confirm, info, loading }

class AppAlertDialog {
  static int countShow = 0;

  static Future show({
    BuildContext? context,
    String? title,
    String? message,
    AppAlertType type = AppAlertType.info,
    bool barrierDismissible = true,
    bool closeOnConfirmBtnTap = true,
    VoidCallback? onConfirmBtnTap,
    VoidCallback? onCancelBtnTap,
  }) async {
    context = OneContext().context;
    if (context == null) {
      return;
    }
    increaseDialogCount();
    FocusScope.of(context).unfocus();
    CoolAlertType coolAlertType;
    switch (type) {
      case AppAlertType.success:
        coolAlertType = CoolAlertType.success;
        break;
      case AppAlertType.error:
        coolAlertType = CoolAlertType.error;
        break;
      case AppAlertType.warning:
        coolAlertType = CoolAlertType.warning;
        break;
      case AppAlertType.confirm:
        coolAlertType = CoolAlertType.confirm;
        break;
      case AppAlertType.info:
        coolAlertType = CoolAlertType.info;
        break;
      case AppAlertType.loading:
        if (OneContext.hasContext) {
          OneContext().showProgressIndicator(
            backgroundColor: const Color(0x6D000000),
            builder: (context) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: const CircularProgressIndicator(),
              ),
            );
            },
          );
        }
        return;
    }
    final dialog = await CoolAlert.show(
      context: context,
      type: coolAlertType,
      title: title,
      text: message,
      titleTextStyle: context.themeOwn().textTheme?.title,
      barrierDismissible: barrierDismissible,
      onConfirmBtnTap: () {
        onConfirmBtnTap?.call();
      },
      onCancelBtnTap: () {
        onCancelBtnTap?.call();
      },
      confirmBtnColor: AppColors.denim,
      closeOnConfirmBtnTap: closeOnConfirmBtnTap,
    );
    decreaseDialogCount();
    return dialog;
  }

  static Future increaseDialogCount() async {
    countShow++;
  }

  static Future decreaseDialogCount() async {
    countShow--;
  }

  static void hide() {
    if (OneContext.hasContext) {
      decreaseDialogCount();
      OneContext().hideProgressIndicator();
    }
  }

  static Future hideAll() async {
    while (countShow > 0) {
      if (OneContext.hasContext) {
        decreaseDialogCount();
        OneContext().hideProgressIndicator();
      }
    }
  }
}