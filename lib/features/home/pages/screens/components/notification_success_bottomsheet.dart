import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/features/home/models/notification/notification.dart';
import 'package:bozorlik/utils/date_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationSuccessBottomsheet extends StatelessWidget {
  const NotificationSuccessBottomsheet({super.key, this.data});

  final NotificationResponseDataItems? data;

  @override
  Widget build(BuildContext context) {
    print("----------------------");
    print("${data.toString()}");
    print("----------------------");

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.vertical,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(height: 4, width: 36, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey))],
          ),
          12.vertical,
          Text(formatDate2(data?.createdAt ?? ""), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 14)),

          12.vertical,
          Text(data?.titleUz ?? "", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
          12.vertical,
          Text(data?.messageUz ?? "", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 14)),
          32.vertical,
          CustomButton(text: "amazing".tr(), onTap: (){}),
          40.vertical,
        ],
      ),
    );
  }
}
