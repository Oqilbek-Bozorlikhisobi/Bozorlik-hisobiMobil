import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/cart/components/show_item_bottomsheet.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/pages/market_share/market_share_screen.dart';
import 'package:bozorlik/features/home/models/marketability.dart';
import 'package:bozorlik/utils/date_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'edit_market_bottomsheet.dart';

class CartItemNew extends StatelessWidget {
  const CartItemNew({super.key, required this.shopping, this.loading, this.onTapDelete});

  final CartResponseData? shopping;
  final Function()? loading;
  final Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 52,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.star,
                  width: 56,
                  height: 56,
                  colorFilter: ColorFilter.mode(Color.fromRGBO(255, 194, 102, 1), BlendMode.srcIn),
                ),
                Text(
                  ((shopping?.name?.isEmpty ?? false) ? "not_found".tr() : shopping?.name ?? "OO").substring(0, 1).toUpperCase(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) {
                    final currentLocale = context.locale.languageCode;

                    // Tilga qarab title-ni tanlash
                    String getTitle() {
                      switch (currentLocale) {
                        case 'uz':
                          return shopping?.marketType?.titleUz ?? "";
                        case 'ky':
                          return shopping?.marketType?.titleUzk ?? "";
                        case 'ru':
                          return shopping?.marketType?.titleRu ?? "";
                        case 'en':
                          return shopping?.marketType?.titleEn ?? "";
                        default:
                          return shopping?.marketType?.titleUz ?? "";
                      }
                    }

                    return RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${shopping?.name ?? ""}: ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                          ),
                          TextSpan(
                            text: "#${getTitle() ?? ""}",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 8),
                Row(
                  children: [
                    // Members
                    SvgPicture.asset(AppIcons.receipt, height: 18, width: 18),
                    SizedBox(width: 4),
                    Text(
                      "${shopping?.marketLists?.length}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1), fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 8),
                    Text("|"),
                    SizedBox(width: 8),
                    SvgPicture.asset(AppIcons.wallet, height: 18, width: 18),
                    SizedBox(width: 4),
                    Text(
                      NumberFormat('#,###', 'en_US').format(shopping?.totalPrice ?? 0).replaceAll(',', ' '),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1), fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 8),
                    Text("|"),
                    SizedBox(width: 8),
                    SvgPicture.asset(AppIcons.calendar, height: 18, width: 18),
                    // Date
                    // Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.grey),
                    SizedBox(width: 4),
                    Text(
                      formatDate(shopping?.createdAt ?? DateTime.now().toString()),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1), fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder:
                    (context) => ShowItemBottomsheet(
                      name: shopping?.name ?? "",
                      onTapEdit: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => EditMarketBottomsheet(name: shopping?.name ?? "", id: shopping?.id ?? ""),
                        );
                      },
                      onTapShare: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => MarketShareScreen(shopping: shopping)));
                      },
                      onTapDelete: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              actions: [
                                CupertinoActionSheetAction(
                                  isDestructiveAction: true,
                                  onPressed: () async {
                                    onTapDelete!();
                                    // bloc.add(DeleteUserEvent(userId: pendingUser?.id ?? "", marketId: widget.shopping?.id ?? ""));
                                    context.pop();
                                  },
                                  child: Text("delete".tr()),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context); // just close
                                  },
                                  child: Text("cancel".tr()),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
              ).then((v) {
                if (v == true) {
                  loading!();
                }
              });
            },
            child: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
    );
  }
}
