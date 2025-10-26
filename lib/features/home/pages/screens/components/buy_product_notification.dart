import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/history/bloc/history_bloc.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../cart/models/cart_response.dart';

class BuyProductNotification extends StatelessWidget {
  const BuyProductNotification({super.key,  required this.data});

  final MarketLists? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(AppImages.cartItem),
            5.horizontal,
            Text(
              data?.quantity.toString() ?? "",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),

            Text(
              " ${data?.unit?.name.toString() ?? "dona"}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            10.horizontal,
            Text("X", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 10)),
            10.horizontal,
            Expanded(
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                data?.productName.toString() ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.darkGreyText),
              ),
            ),
            20.horizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${"total".tr()}:"),
                  Builder(
                    builder: (context) {
                      var totalPrice =
                          data?.calculationType == "one"
                              ? ((data?.price ?? 0) * (data?.quantity ?? 0))
                                  .toString()
                              : data?.price.toString();
                      return Text(
                        PriceFormatterService.formatPrice(
                            totalPrice.toString()??""
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(color: AppColors.grey),
      ],
    );
  }
}
