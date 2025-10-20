import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback? onPress;

  const ErrorView({super.key, required this.error, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.noInternet),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(error,),
          ),
          if(onPress != null) Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32),
            child: CustomButton(onTap:(){}, text: "Qayta yuklash",),
          )
        ],
      ),
    );
  }
}
