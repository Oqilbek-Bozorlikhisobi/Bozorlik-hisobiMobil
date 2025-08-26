import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bozorlik/common/extension/number_extension.dart';

import '../exceptions/failure.dart';
import '../values/app_assets.dart';
import 'custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.onTap,
    this.error,
    this.bgColor = Colors.transparent,
    required this.isLoading,
  });

  final Function() onTap;
  final Object? error;
  final Color bgColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var errorText = "something_went_wrong".tr();
    if (error is ConnectionFailure) {
      errorText = (error as ConnectionFailure).getLocalizedMessage(context);
    } else if (error is ServerFailure) {
      errorText = (error as ServerFailure).getLocalizedMessage(context);
    } else if (error is UnknownFailure) {
      errorText = (error as UnknownFailure).getLocalizedMessage(context);
    }
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppIcons.noInternet),
                    16.vertical,
                    Text(
                      errorText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: "Try again",
                onTap: onTap,
                isLoading: isLoading,
              ),
            ),
            12.vertical,
          ],
        ),
      ),
    );
  }
}
