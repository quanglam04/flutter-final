import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import '../../../gen/assets.gen.dart';
import 'app_button.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.errorMessage,
    this.onRetry,
  });

  final String errorMessage;
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    final errorStyle = context
        .themeOwn()
        .textTheme
        ?.primary
        ?.copyWith(color: context.themeOwn().colorSchema?.secondary2);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.error.image(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: errorStyle,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            child: AppButton.primary(
              title: 'retry'.tr(),
              onPressed: () {
                onRetry?.call();
              },
              backgroundColor: Colors.red,
            ),
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
          )
        ],
      ),
    );
  }
}