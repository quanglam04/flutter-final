import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/colors.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/safe_click_widget.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.hasBorder = true,
    this.enableShadow = true,
    this.onPressed,
  }) : super(key: key);

  final Color? backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget child;
  final bool hasBorder;
  final bool enableShadow;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorSchema = context.themeOwn().colorSchema;
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          if (enableShadow)
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(5, 5),
            ),
        ],
        border: hasBorder
            ? Border.all(
                color: colorSchema?.border ?? AppColors.pattensBlue,
                width: 0.5,
              )
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: backgroundColor ?? colorSchema?.whiteText,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.hardEdge,
        child: SafeClickWidget(
          onPressed: onPressed,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}