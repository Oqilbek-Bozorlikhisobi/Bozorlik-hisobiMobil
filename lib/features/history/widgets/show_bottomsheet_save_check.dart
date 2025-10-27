import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/history/models/get_all_history_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowBottomsheetSaveCheck extends StatefulWidget {
  const ShowBottomsheetSaveCheck({super.key, required this.data, required this.onTapRetry, required this.onTapCheck});

  final HistoryResponseDataData data;
  final Function() onTapRetry;
  final Function() onTapCheck;

  @override
  State<ShowBottomsheetSaveCheck> createState() => _ShowBottomsheetSaveCheckState();
}

class _ShowBottomsheetSaveCheckState extends State<ShowBottomsheetSaveCheck> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.vertical,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(height: 4, width: 32, color: AppColors.grey)]),
            12.vertical,
            Text(widget.data.name ?? "", style: Theme.of(context).textTheme.titleMedium),
            Container(
              color: AppColors.white,

              child: GestureDetector(
                onTap: () {
                  widget.onTapRetry();
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.retry),
                    10.horizontal,
                    Text("retry_market".tr(), style: Theme.of(context).textTheme.bodyMedium),
                    Spacer(),
                    SvgPicture.asset(AppIcons.arrowRight),
                  ],
                ),
              ),
            ),
            12.vertical,
            Container(
              color: AppColors.white,
              child: GestureDetector(
                onTap: () {
                  widget.onTapCheck();
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.check),
                    10.horizontal,
                    Text("market_check".tr(), style: Theme.of(context).textTheme.bodyMedium),
                    Spacer(),
                    SvgPicture.asset(AppIcons.arrowRight),
                  ],
                ),
              ),
            ),
            70.vertical,
          ],
        ),
      ),
    );
  }
}
