import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnBuyProduct extends StatelessWidget {
  const UnBuyProduct({
    super.key,
    required this.state,
    required this.index,
    required this.onTapInfo,
    required this.onTapBuy,
    required this.onTapDelete,
  });

  final InnerCartState state;
  final int index;

  final Function() onTapInfo;
  final Function() onTapBuy;
  final Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(AppImages.cartItem),
            5.horizontal,
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                state.unBuyProducts?[index].quantity.toString() ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),

            Text(
              " ${state.unBuyProducts?[index].unit?.name.toString() ?? "dona"}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            10.horizontal,
            Text("X", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 10)),
            10.horizontal,
            Expanded(
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                state.unBuyProducts?[index].productName.toString() ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.darkGreyText),
              ),
            ),
            20.horizontal,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onTapInfo();
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(12)),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(AppIcons.information)),
                  ),
                ),
                8.horizontal,
                GestureDetector(
                  onTap: () {
                    onTapBuy();
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(12)),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.check, color: AppColors.white)),
                  ),
                ),
                8.horizontal,
                GestureDetector(
                  onTap: () {
                    onTapDelete();
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.red, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.delete, colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(color: AppColors.grey),
      ],
    );
  }
}
