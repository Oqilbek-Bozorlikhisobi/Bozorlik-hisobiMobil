import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/theme.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.7,
      color: CupertinoColors.systemGroupedBackground,
      padding: EdgeInsets.symmetric(horizontal: 12),
      onPressed: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: CupertinoColors.black,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: CupertinoColors.black,
            size: 16,
          ),
        ],
      ),
    );
  }
}
