import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteProductBottomsheet extends StatelessWidget {
  const DeleteProductBottomsheet({super.key, required this.product, required this.deleteProduct});

  final MarketLists? product;
  final Function(String id) deleteProduct;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(height: 4, width: 36, decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8)))],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(color: AppColors.backGround, borderRadius: BorderRadius.circular(8)),
            //       child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.close, color: AppColors.greyText)),
            //     ),
            //   ],
            // ),
            Text(product?.productName ?? "", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
            16.vertical,
            Text("delete_product".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
            16.vertical,
            CustomButton(
              bgColor: AppColors.red,
              text: "delete".tr(),
              onTap: () {
                deleteProduct(product?.id ?? '');
              },
            ),
            16.vertical,
            CustomButton(
              fontW: FontWeight.w500,
              textColor: AppColors.darkGrey,
              bgColor: AppColors.grey,
              text: "cancel".tr(),
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
