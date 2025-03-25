import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

typedef AppDropDownOptionToString<T> = String Function(T option);

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    Key? key,
    required this.items,
    this.hintText = '',
    this.enabled = true,
    this.controller,
    this.onTap,
    this.onChanged,
    this.validator,
    this.value,
    required this.displayStringForOption,
    this.errorText,
  }) : super(key: key);

  final T? value;
  final List<T> items;
  final String hintText;
  final String? errorText;
  final bool enabled;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final AppDropDownOptionToString<T> displayStringForOption;

  @override
  Widget build(BuildContext context) {
    final fillColor =
        enabled ? Colors.transparent : context.themeOwn().colorSchema?.border;
    final textStyle = context
        .themeOwn()
        .textTheme
        ?.h1
        ?.copyWith(color: context.themeOwn().colorSchema?.mainText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField2<T>(
          value: value,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    displayStringForOption(e),
                    style: context.themeOwn().textTheme?.highlightsMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          isExpanded: true,
          hint: Text(
            hintText,
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            fillColor: fillColor,
          ),
          style: textStyle,
          iconStyleData: IconStyleData(
            icon: Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.only(right: 10),
              child: Assets.icons.icDown
                  .svg(color: context.themeOwn().colorSchema?.subText),
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            offset: const Offset(0, -4),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            selectedMenuItemBuilder: (_, child) {
              return Container(
                color: context.themeOwn().colorSchema?.primary,
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: child,
                ),
              );
            },
          ),
          onChanged: enabled ? (value) => onChanged?.call(value) : null,
          validator: validator,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              errorText ?? '',
              style: Theme.of(context).inputDecorationTheme.errorStyle,
            ),
          ),
      ],
    );
  }
}