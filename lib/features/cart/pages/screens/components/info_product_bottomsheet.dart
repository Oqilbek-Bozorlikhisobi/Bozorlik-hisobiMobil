import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:flutter/material.dart';

class InfoProductBottomsheet extends StatelessWidget {
  const InfoProductBottomsheet({super.key, required this.product});
final MarketLists? product;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
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
          Text(product?.productName??"")
        ],
      ),
    );
  }
}
