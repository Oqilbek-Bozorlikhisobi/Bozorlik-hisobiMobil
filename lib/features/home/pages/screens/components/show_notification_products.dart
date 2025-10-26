import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/history/widgets/buy_product_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../cart/models/cart_response.dart';
import 'buy_product_notification.dart';

class ShowNotificationProducts extends StatefulWidget {
  ShowNotificationProducts({super.key, required this.marketLists});

  final List<MarketLists>? marketLists;

  @override
  State<ShowNotificationProducts> createState() =>
      _ShowNotificationProductsState();
}

class _ShowNotificationProductsState extends State<ShowNotificationProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child:
                  (widget.marketLists?.isNotEmpty ?? false)
                      ? ListView.builder(
                        itemCount: widget.marketLists?.length,
                        itemBuilder: (context, index) {
                          return BuyProductNotification(
                            data: widget.marketLists?[index],
                          );
                        },
                      )
                      : SvgPicture.asset(AppIcons.emptyMarket),
            ),
          ],
        ),
      ),
    );
  }
}
