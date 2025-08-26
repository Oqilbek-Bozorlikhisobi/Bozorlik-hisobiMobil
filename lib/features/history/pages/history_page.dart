import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_error_widget.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../main/notifiers/index_notifier.dart';
import '../notifiers/history_notifier.dart';
import '../widgets/history_cart_item.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('history').tr()),
      body: history.when(
        data: (data) {
          return data.isEmpty
              ? buildEmpty(ref)
              : ListView.builder(
                itemCount: data.length,

                itemBuilder: (context, index) {
                  return HistoryCartItem(cart: data[index]);
                },
              );
        },
        error: (e, s) {
          return CustomErrorWidget(
            onTap: () {
              ref.invalidate(historyNotifierProvider);
            },
            isLoading: history.isLoading,
            error: e,
          );
        },
        loading: () {
          return Center(child: LoadingWidget());
        },
      ),
    );
  }

  Center buildEmpty(WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.empty, height: 200, width: 200),
            12.vertical,
            Text(
              "no_history".tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            10.vertical,
            Text(
              "start_adding_products".tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            10.vertical,
            CustomButton(
              text: "view_products".tr(),
              onTap: () {
                ref.read(indexNotifierProvider.notifier).changeIndex(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
