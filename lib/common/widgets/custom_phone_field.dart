import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/extension/number_extension.dart';

import '../../app/theme.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    super.key,
    this.hintText,
    this.onChange,
    this.labelText,
    this.suffixIcon,
    this.validatorText,
    this.textInputAction,
    this.fillColor,
    this.initialValue,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
    this.borderColor,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.suffixIconOnTap,
  });

  final TextEditingController? controller;
  final Function(String value)? onChange;

  final String? labelText;
  final String? hintText;
  final String? suffixIcon;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? borderColor;
  final String? initialValue;
  final String? validatorText;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String>? validator;
  final Function()? suffixIconOnTap;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  late TextEditingController innerController;
  late MaskTextInputFormatter _maskFormatter;

  @override
  void initState() {
    _maskFormatter = MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      initialText: widget.initialValue,
    );

    innerController =
        widget.controller ??
        TextEditingController(text: _maskFormatter.getMaskedText());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty) ...[
          Text(
            widget.labelText!,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          8.vertical,
        ],
        TextFormField(
          key: ValueKey("phone-field"),
          maxLines: 1,
          minLines: 1,
          validator:
              widget.validator ??
              (_) {
                if (_maskFormatter.getUnmaskedText().length != 9 &&
                    widget.validatorText != null) {
                  return widget.validatorText;
                }
                return null;
              },
          textCapitalization: widget.textCapitalization,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          inputFormatters: [_maskFormatter],
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: TextInputType.phone,
          onChanged: (_) {
            widget.onChange?.call("+998${_maskFormatter.getUnmaskedText()}");
            setState(() {});
          },
          controller: innerController,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            prefixIcon: const Text(
              "+998",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ).paddingOnly(top: 14, bottom: 14, left: 12),
            suffixIcon:
                widget.suffixIcon == null
                    ? null
                    : IconButton(
                      icon: SvgPicture.asset(widget.suffixIcon!),
                      onPressed: widget.suffixIconOnTap,
                    ),
            filled: true,
            fillColor:
                widget.fillColor ?? CupertinoColors.systemGroupedBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: CupertinoColors.systemGroupedBackground,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.primaryColor,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: CupertinoColors.destructiveRed,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: CupertinoColors.destructiveRed,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color:
                    widget.borderColor ??
                    CupertinoColors.systemGroupedBackground,
                width: 2,
              ),
            ),
            isDense: true,

            errorStyle: const TextStyle(fontSize: 12),
            hintText: widget.hintText ?? "(XX) XXX-XX-XX",
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
