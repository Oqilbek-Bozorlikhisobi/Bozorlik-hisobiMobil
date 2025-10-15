import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/languages/pages/languages_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.svg, required this.title, required this.onTap, this.title2});

  final String svg;
  final String title;
  final String? title2;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white
        ),
        child: Row(
          children: [
            SvgPicture.asset(svg),
            16.horizontal,
            Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 18)),
            Spacer(),
           title2!=null?Text(title2??"",style:Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.greyText) ,): SvgPicture.asset(AppIcons.arrowRight),
          ],
        ),
      ),
    );
  }
}
