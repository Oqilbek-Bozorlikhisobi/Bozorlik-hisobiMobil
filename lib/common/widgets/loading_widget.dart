import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import '../../app/theme.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color, this.height});

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      // Platform.isAndroid
      //     ? SizedBox(
      //         height: height,
      //         child: CircularProgressIndicator(
      //           color: color ?? AppColors.primaryColor,
      //           strokeWidth: 2.5,
      //           backgroundColor: Colors.black.withOpacity(.1),
      //         ),
      //       )
      //     :
      CupertinoActivityIndicator(
              color: color ?? AppColors.primaryColor,
              radius: height ?? 15,
            ),
    );
  }
}
