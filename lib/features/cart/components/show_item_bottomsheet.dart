import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowItemBottomsheet extends StatefulWidget {
  const ShowItemBottomsheet({super.key, required this.name, required this.onTapEdit, required this.onTapShare, required this.onTapDelete});

  final String name;
  final Function() onTapEdit;
  final Function() onTapShare;
  final Function() onTapDelete;

  @override
  State<ShowItemBottomsheet> createState() => _ShowItemBottomsheetState();
}

class _ShowItemBottomsheetState extends State<ShowItemBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.vertical,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(height: 4, width: 32, decoration: BoxDecoration(color: AppColors.grey))],
              ),
              12.vertical,
              Text(widget.name, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              12.vertical,
              GestureDetector(
                onTap: () {
                  widget.onTapEdit();
                },
                child: Container(
                  color: AppColors.white,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.edit),
                      13.horizontal,
                      Text("edit_name".tr(), style: Theme.of(context).textTheme.bodyMedium),
                      Spacer(),
                      SvgPicture.asset(AppIcons.arrowRight),
                    ],
                  ),
                ),
              ),
              12.vertical,
              GestureDetector(
                onTap: () {
                  widget.onTapShare();
                },
                child: Container(
                  color: AppColors.white,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.send),
                      13.horizontal,

                      Text("share_shopping".tr(), style: Theme.of(context).textTheme.bodyMedium),
                      Spacer(),
                      SvgPicture.asset(AppIcons.arrowRight),
                    ],
                  ),
                ),
              ),
              12.vertical,
              GestureDetector(
                onTap: () {
                  widget.onTapDelete();
                },
                child: Container(
                  color: AppColors.white,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.delete),
                      13.horizontal,

                      Text("delete".tr(), style: Theme.of(context).textTheme.bodyMedium),
                      Spacer(),
                      SvgPicture.asset(AppIcons.arrowRight),
                    ],
                  ),
                ),
              ),
              40.vertical,
            ],
          ),
        ),
      ),
    );
  }
}
