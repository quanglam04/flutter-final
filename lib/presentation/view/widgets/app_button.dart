import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/colors.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import 'safe_click_widget.dart';

const kDefaultPaddingButton = EdgeInsets.zero;

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    this.enable = true,
    this.minWidth,
    this.height = 0,
    this.backgroundColor = Colors.transparent,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 6,
    this.titleStyle = const TextStyle(color: AppColors.white),
    required this.onPressed,
    this.borderColor,
    this.padding = kDefaultPaddingButton,
    this.isIconButton = false,
  }) : super(key: key);

  factory AppButton.primary({
    bool enable,
    required String title,
    TextStyle? titleStyle,
    required VoidCallback onPressed,
    Color? backgroundColor,
    double borderRadius,
    Widget? icon,
    double? height,
  }) = _AppButtonPrimary;

  factory AppButton.outline({
    required String title,
    required VoidCallback onPressed,
  }) = _AppButtonOutline;

  factory AppButton.mini({
    bool enable,
    required String title,
    required VoidCallback onPressed,
  }) = _AppButtonMini;

  const factory AppButton.icon({
    bool enable,
    required Widget child,
    required VoidCallback onPressed,
  }) = _AppButtonIcon;

  final Widget child;
  final TextStyle? titleStyle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool enable;
  final double? minWidth;
  final double height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color? borderColor;
  final EdgeInsets padding;
  final bool isIconButton;

  @override
  Widget build(BuildContext context) {
    final border =
        borderColor != null && enable
            ? BorderSide(color: borderColor!, width: 1)
            : BorderSide.none;
    if (isIconButton) {
      return InkResponse(
        containedInkWell: false,
        radius: 24,
        child: child,
        onTap: enable ? onPressed : null,
      );
    } else {
      return Material(
        color: enable ? backgroundColor : Theme.of(context).disabledColor,
        textStyle: const TextStyle(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: border,
        ),
        child: SafeClickWidget(
          splashFactory: InkSparkle.splashFactory,
          onPressed: enable ? onPressed : null,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            constraints: BoxConstraints(
              minWidth: minWidth ?? 0,
              minHeight: enable ? height : 48,
            ),
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) prefixIcon!,
                child,
                if (suffixIcon != null) suffixIcon!,
              ],
            ),
          ),
        ),
      );
    }
  }
}

class _AppButtonPrimary extends AppButton {
  _AppButtonPrimary({
    required String title,
    TextStyle? titleStyle,
    required super.onPressed,
    double borderRadius = 6,
    Color? backgroundColor,
    bool enable = true,
    Widget? icon,
    double? height,
  }) : super(
         child: _AppButtonPrimaryChild(
           title: title,
           icon: icon,
           titleStyle: titleStyle,
         ),
         enable: enable,
         height: height ?? 48,
         backgroundColor: backgroundColor ?? AppColors.denim,
         minWidth: double.infinity,
         borderRadius: borderRadius,
       );
}

class _AppButtonPrimaryChild extends StatelessWidget {
  const _AppButtonPrimaryChild({
    Key? key,
    required this.title,
    this.icon,
    this.titleStyle,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final themOwn = context.themeOwn();
    final _titleStyle = themOwn.textTheme?.highlightsBold
        ?.copyWith(color: themOwn.colorSchema?.whiteText)
        .merge(titleStyle);
    return Row(
      children: [
        if (icon != null)
          Padding(padding: const EdgeInsets.only(right: 8), child: icon!),
        Text(title, style: _titleStyle),
      ],
    );
  }
}

class _AppButtonMini extends AppButton {
  _AppButtonMini({
    required String title,
    required VoidCallback onPressed,
    bool enable = true,
  }) : super(
         child: _AppButtonMiniChild(title: title),
         onPressed: onPressed,
         borderRadius: 6,
         backgroundColor: AppColors.denim,
         padding: const EdgeInsets.symmetric(horizontal: 12),
         height: 34,
         enable: enable,
       );
}

class _AppButtonMiniChild extends StatelessWidget {
  const _AppButtonMiniChild({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final themOwn = context.themeOwn();
    return Text(
      title,
      style: themOwn.textTheme?.button?.copyWith(
        color: themOwn.colorSchema?.whiteText,
      ),
    );
  }
}

class _AppButtonIcon extends AppButton {
  const _AppButtonIcon({
    required super.child,
    required super.onPressed,
    bool enable = true,
    EdgeInsets padding = EdgeInsets.zero,
  }) : super(
         backgroundColor: Colors.transparent,
         height: 0,
         isIconButton: true,
         enable: enable,
         padding: padding,
       );
}

class _AppButtonOutline extends AppButton {
  _AppButtonOutline({required String title, required super.onPressed})
    : super(
        child: _AppButtonOutlineChild(title: title),
        backgroundColor: Colors.transparent,
        borderColor: AppColors.pattensBlue,
        borderRadius: 12,
        height: 40,
        minWidth: double.infinity,
      );
}

class _AppButtonOutlineChild extends StatelessWidget {
  const _AppButtonOutlineChild({Key? key, required this.title})
    : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final themOwn = context.themeOwn();
    return Text(title, style: TextStyle(color: themOwn.colorSchema?.subText));
  }
}
