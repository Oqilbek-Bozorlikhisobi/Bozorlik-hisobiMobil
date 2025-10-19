import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/history/bloc/history_bloc.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuyProductHistory extends StatelessWidget {
  const BuyProductHistory({super.key, required this.state, required this.index});

  final HistoryState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(AppImages.cartItem),
            5.horizontal,
            Text(
              state.innerHistory?.marketLists?[index].quantity.toString() ?? "",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),

            Text(
              " ${state.innerHistory?.marketLists?[index].unit?.nameUz.toString() ?? "dona"}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            10.horizontal,
            Text("X", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 10)),
            10.horizontal,
            Expanded(
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                state.innerHistory?.marketLists?[index].productName.toString() ?? "",
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
                          state.innerHistory?.marketLists?[index].calculationType == "one"
                              ? ((state.innerHistory?.marketLists?[index].price ?? 0) * (state.innerHistory?.marketLists?[index].quantity ?? 0))
                                  .toString()
                              : state.innerHistory?.marketLists?[index].price.toString();
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
