import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/resources/colors.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

enum CheckBoxSize {
  normal(22.0),
  small(18.0);

  const CheckBoxSize(this.value);

  final double value;
}

///Widget that draw a beautiful checkbox rounded. Provided with animation if wanted
class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    Key? key,
    this.value = false,
    this.checkedWidget,
    this.uncheckedWidget = const SizedBox.shrink(),
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderColor,
    this.size = CheckBoxSize.normal,
    this.animationDuration = const Duration(milliseconds: 100),
    this.isRound = true,
    this.iconPadding = 4.0,
    this.enable = true,
    this.title,
    this.titleStyle,
    this.onChanged,
  }) : super(key: key);

  const AppCheckBox.small({
    Key? key,
    this.value = false,
    this.checkedWidget,
    this.uncheckedWidget = const SizedBox.shrink(),
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderColor,
    this.size = CheckBoxSize.small,
    this.animationDuration = const Duration(milliseconds: 100),
    this.isRound = true,
    this.iconPadding = 4.0,
    this.enable = true,
    this.title,
    this.titleStyle,
    this.onChanged,
  }) : super(key: key);

  ///Define wether the checkbox is marked or not
  final bool value;

  ///Define the widget that is shown when Widgets is checked
  final Widget? checkedWidget;

  ///Define the widget that is shown when Widgets is unchecked
  final Widget uncheckedWidget;

  ///Define the color that is shown when Widgets is checked
  final Color? checkedColor;

  ///Define the color that is shown when Widgets is unchecked
  final Color? uncheckedColor;

  ///Define the color that is shown when Widgets is disabled
  final Color? disabledColor;

  ///Define the border of the widget
  final Border? border;

  ///Define the border color  of the widget
  final Color? borderColor;

  ///Define the size of the checkbox
  final CheckBoxSize size;

  ///Define Function that os executed when user tap on checkbox
  ///If onTap is given a null callback, it will be disabled
  final Function(bool)? onChanged;

  ///Define the duration of the animation. If any
  final Duration animationDuration;

  final bool isRound;

  final double iconPadding;

  final bool enable;

  final String? title;

  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final _checkedWidget = checkedWidget ?? Assets.icons.icCheck.svg();
    final _checkedColor = checkedColor ??
        context.themeOwn().colorSchema?.primary ??
        AppColors.denim;
    final _disabledColor = disabledColor ?? Theme.of(context).disabledColor;
    final _borderColor = borderColor ??
        context.themeOwn().colorSchema?.border ??
        AppColors.pattensBlue;

    if (enable)
      return GestureDetector(
        onTap: () => onChanged?.call(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: AnimatedContainer(
                duration: animationDuration,
                height: size.value,
                width: size.value,
                decoration: BoxDecoration(
                  color: value ? _checkedColor : Colors.transparent,
                  border: value ? null : Border.all(color: _borderColor),
                  borderRadius: borderRadius,
                ),
                child: Container(
                  padding: EdgeInsets.all(iconPadding),
                  child: value ? _checkedWidget : uncheckedWidget,
                ),
              ),
            ),
            if (title != null) _getTitle(context),
          ],
        ),
      );
    else
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: AnimatedContainer(
              duration: animationDuration,
              height: size.value,
              width: size.value,
              decoration: BoxDecoration(
                color: _disabledColor,
                borderRadius: borderRadius,
              ),
              child: Container(
                padding: EdgeInsets.all(iconPadding),
                child: value ? _checkedWidget : uncheckedWidget,
              ),
            ),
          ),
          if (title != null) _getTitle(context),
        ],
      );
  }

  Widget _getTitle(BuildContext context) {
    final _titleStyle = titleStyle ??
        context
            .styleOwn()
            ?.primary
            ?.copyWith(color: context.colorOwn()?.mainText);

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title ?? '',
        style: _titleStyle,
      ),
    );
  }

  BorderRadius get borderRadius {
    if (isRound) {
      return BorderRadius.circular(4);
    } else {
      return BorderRadius.zero;
    }
  }
}