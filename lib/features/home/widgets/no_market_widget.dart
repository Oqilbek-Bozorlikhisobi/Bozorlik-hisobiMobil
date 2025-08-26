import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../categories/widgets/cart_create_modal.dart';

class NoMarketWidget extends StatelessWidget {
  const NoMarketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(
          spacing: 8,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 28),
            Spacer(),
            CustomButton(
              text: "create_shopping_list".tr(),
              onTap: () {
                CartCreateModal.show(context);
              },
              height: 30,
              width: null,
            ),
          ],
        ),
      ),
    );
  }
}
