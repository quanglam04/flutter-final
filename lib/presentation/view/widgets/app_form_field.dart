import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/utils/decimal_text_input_formatter.dart';

class AppFormField extends StatefulWidget {
  const AppFormField({
    Key? key,
    this.decoration,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.maxLine = 1,
    this.maxLength = TextField.noMaxLength,
    this.obscuringCharacter = '*',
    this.obscureText = false,
    this.focusNode,
    this.controller,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.value,
    this.hintText,
    this.errorText,
  }) : super(key: key);

  final String? value;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final bool readOnly;
  final int? maxLine;
  final int? maxLength;
  final FocusNode? focusNode;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enabled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller =
        widget.controller ?? TextEditingController(text: widget.value ?? '');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppFormField oldWidget) {
    if (_controller.text != widget.value) {
      _controller.text = widget.value ?? '';
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final _decoration = (widget.decoration ?? const InputDecoration())
        .applyDefaults(Theme.of(context).inputDecorationTheme);
    final fillColor = widget.enabled
        ? Colors.transparent
        : context.themeOwn().colorSchema?.border;

    final errorText = widget.errorText ?? _decoration.errorText;

    final _inputFormatter =  widget.inputFormatters ?? [];

    if (widget.keyboardType == TextInputType.number ) {
      _inputFormatter.add(DecimalTextInputFormatter());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.maxLine == 1 ? 40 : 80,
          child: TextFormField(
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLine,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            controller: _controller,
            inputFormatters: _inputFormatter,
            style: context.themeOwn().textTheme?.highlightsMedium,
            decoration: InputDecoration(
              counterStyle: const TextStyle(height: double.minPositive,),
              counterText: '',
              suffixStyle: _decoration.suffixStyle,
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: _buildSuffixIcon(_decoration),
              hintText: widget.hintText ?? _decoration.hintText,
              hintStyle: _decoration.hintStyle,
              fillColor: fillColor,
            ),
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmitted,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(errorText, style: _decoration.errorStyle),
          ),
      ],
    );
  }

  Widget _buildSuffixIcon(InputDecoration _decoration) {
    return UnconstrainedBox(
      alignment: Alignment.centerRight,
      child: _decoration.suffixText != null
          ? Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                _decoration.suffixText ?? '',
                style: _decoration.suffixStyle,
              ),
            )
          : _decoration.suffixIcon,
    );
  }
}