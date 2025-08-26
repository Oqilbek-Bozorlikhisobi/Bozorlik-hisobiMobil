import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../app/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.radius,
    this.bgColor,
    this.textColor,
    this.width = double.infinity,
    this.isLoading = false,
    this.paddingH,
    this.fontSize,
    this.leftIcon,
    this.rightW,
    this.borderColor,
    this.fontW,
    this.iconC,
    this.height,
    this.disabled = false,
    this.boxShadow,
  });

  final String text;
  final Function() onTap;
  final BorderRadius? radius;
  final double? paddingH;
  final double? fontSize;
  final FontWeight? fontW;
  final Widget? leftIcon;
  final Color? bgColor;
  final Color? iconC;
  final Color? borderColor;
  final Color? textColor;
  final bool isLoading;
  final double? height;
  final double? width;

  final Widget? rightW;
  final bool disabled;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor =
        disabled
            ? CupertinoColors.systemGrey.withAlpha(100)
            : (bgColor ?? AppColors.primaryColor);

    return SizedBox(
      width: width,
      height: height ?? 48,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: effectiveBgColor,
          boxShadow: boxShadow,
          borderRadius: radius ?? BorderRadius.circular(10),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: CupertinoButton(
          pressedOpacity: 0.7,
          padding:
              width == null
                  ? EdgeInsets.symmetric(horizontal: 12)
                  : EdgeInsets.zero,
          onPressed: disabled ? null : onTap,
          borderRadius: radius ?? BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leftIcon != null) ...[
                leftIcon!,
                if (text.isNotEmpty) const SizedBox(width: 8),
              ],
              if (isLoading)
                const CupertinoActivityIndicator(color: CupertinoColors.white)
              else
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: fontW ?? FontWeight.w600,
                    color: textColor ?? CupertinoColors.white,
                    fontSize: fontSize ?? 16,
                  ),
                ),
              if (rightW != null) ...[const SizedBox(width: 8), rightW!],
            ],
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.radius,
    this.bgColor,
    this.textColor,
    this.isLoading = false,
    this.fontSize,
    this.fontW,
    this.leftIcon,
    this.rightW,
    this.borderColor,
    this.iconC,
    this.height,
    this.width = double.infinity,
    this.disabled = false,
    this.boxShadow,
  });

  final String text;
  final Function() onTap;
  final BorderRadius? radius;
  final double? fontSize;
  final FontWeight? fontW;
  final Widget? leftIcon;
  final Widget? rightW;

  final Color? bgColor;       // background color (default transparent)
  final Color? borderColor;   // border outline color
  final Color? textColor;
  final Color? iconC;

  final bool isLoading;
  final bool disabled;
  final double? height;
  final double? width;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor =
    disabled ? CupertinoColors.systemGrey.withAlpha(100) : (borderColor ?? AppColors.primaryColor);
    final effectiveTextColor =
    disabled ? CupertinoColors.systemGrey : (textColor ?? AppColors.primaryColor);

    return SizedBox(
      width: width,
      height: height ?? 48,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: radius ?? BorderRadius.circular(10),
          border: Border.all(color: effectiveBorderColor, width: 1.5),
          boxShadow: boxShadow,
        ),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          borderRadius: radius ?? BorderRadius.circular(10),
          onPressed: disabled ? null : onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leftIcon != null) ...[
                leftIcon!,
                if (text.isNotEmpty) const SizedBox(width: 8),
              ],
              if (isLoading)
                const CupertinoActivityIndicator()
              else
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: fontW ?? FontWeight.w600,
                    color: effectiveTextColor,
                    fontSize: fontSize ?? 16,
                  ),
                ),
              if (rightW != null) ...[const SizedBox(width: 8), rightW!],
            ],
          ),
        ),
      ),
    );
  }
}
