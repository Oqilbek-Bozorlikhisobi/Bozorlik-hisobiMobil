import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bozorlik/common/extension/number_extension.dart';

import '../../app/theme.dart';

import 'dart:async';

import '../values/app_assets.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChange,
    this.labelText,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.validatorText,
    this.isObscure = false,
    this.textInputAction,
    this.fillColor,
    this.initialValue,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.formatter,
    this.textInputType,
    this.maxLength,
    this.focusNode,
    this.borderColor,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.words,
    this.validator,
    this.isDebounce = true, // Add isDebounce flag
    this.isDeletable = false,
    this.prefixWidget,
  });

  final TextEditingController? controller;
  final Function(String value)? onChange;

  final String? labelText;
  final String? hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isObscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? borderColor;
  final String? initialValue;
  final String? validatorText;
  final int? maxLines;
  final int? minLines;
  final TextInputType? textInputType;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? formatter;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String>? validator;
  final bool isDebounce;
  final bool isDeletable;
  final Widget? prefixWidget;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController innerController;
  Timer? _debounceTimer; // Timer for debounce
  bool _obscureText = false;

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialValue != oldWidget.initialValue &&
          widget.controller == null) {
        innerController.text = widget.initialValue ?? "";
      }
    });
  }

  @override
  void initState() {
    innerController =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _obscureText = widget.isObscure;
    super.initState();
  }

  void _debounceOnChanged(String value) {
    if (widget.isDebounce) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        widget.onChange?.call(value);
      });
    } else {
      widget.onChange?.call(value);
    }
    setState(() {});
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
          maxLines: widget.isObscure ? 1 : (widget.maxLines ?? 1),
          minLines: widget.minLines ?? 1,
          validator:
              widget.validator ??
              (_) {
                if (innerController.text.isEmpty == true &&
                    widget.validatorText != null) {
                  return widget.validatorText;
                }
                return null;
              },
          textCapitalization: widget.textCapitalization,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          inputFormatters: widget.formatter,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: widget.textInputType,
          onChanged: _debounceOnChanged,
          controller: innerController,
          obscureText: _obscureText,
          cursorColor: AppColors.primaryColor,
          maxLength: widget.maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            suffixIcon:
                widget.isObscure
                    ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        size: 20,
                        color: CupertinoColors.systemGrey,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : (widget.isDeletable == true &&
                        innerController.text.isNotEmpty)
                    ? GestureDetector(
                      child: Icon(CupertinoIcons.clear),
                      onTap: () {
                        innerController.clear();
                        _debounceOnChanged("");
                      },
                    )
                    : widget.suffixIcon != null
                    ? SvgPicture.asset(widget.suffixIcon!)
                    : null,

            prefixIcon:
                widget.prefixIcon != null
                    ? SvgPicture.asset(
                      widget.prefixIcon!,
                      height: 18,
                      width: 18,
                    ).paddingOnly(top: 12, bottom: 12)
                    : widget.prefixWidget,
            filled: true,
            fillColor: CupertinoColors.systemGroupedBackground,
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
              borderSide: BorderSide(
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
            errorStyle: TextStyle(fontSize: 12),
            hintText: widget.hintText,
            hintStyle: TextStyle(
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
