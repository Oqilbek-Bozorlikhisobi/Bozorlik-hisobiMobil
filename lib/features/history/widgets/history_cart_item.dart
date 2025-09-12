import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/datetime_extension.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/history/repositories/history_repository.dart';
import 'package:bozorlik/features/main/notifiers/index_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../cart/widgets/no_image_widget.dart';

class HistoryCartItem extends HookConsumerWidget {
  final CartModel cart;

  const HistoryCartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final isExpanded = useState(false);

    final chevronController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final chevronTurns = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: chevronController, curve: Curves.easeInOut),
    );

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CupertinoColors.extraLightBackgroundGray),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.primaryColor,
          collapsedIconColor: AppColors.primaryColor,
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${cart.totalPrice ?? "0"} ${"currency".tr()}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                [
                  cart.location,
                  DateTime.tryParse(cart.createdAt ?? "")?.formatDate() ?? "",
                ].join(" - "),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
          // 👇 custom trailing with chevron animation
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  ref
                      .read(cartNotifierProvider.notifier)
                      .createCartByHistory(historyId: cart.id ?? "");
                  ref.read(indexNotifierProvider.notifier).changeIndex(2);
                },
                icon: const Icon(CupertinoIcons.restart),
              ),
              IconButton(
                onPressed: () async {
                  isLoading.value = true;
                  try {
                    await generateAndOpenPdf(context, cart: cart);
                  } catch (e, s) {}
                  isLoading.value = false;
                },
                icon:
                    isLoading.value
                        ? const LoadingWidget()
                        : const Icon(Icons.save_alt_outlined),
              ),
              RotationTransition(
                turns: chevronTurns,
                child: const Icon(Icons.expand_more),
              ),
            ],
          ),

          // listen to expand/collapse
          onExpansionChanged: (expanded) {
            isExpanded.value = expanded;
            if (expanded) {
              chevronController.forward();
            } else {
              chevronController.reverse();
            }
          },

          title: Row(
            children: [
              Expanded(
                child: Text(
                  cart.name ?? "-",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          children: [
            12.vertical,
            if (cart.marketLists != null && cart.marketLists!.isNotEmpty)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cart.marketLists!.length,
                separatorBuilder:
                    (_, __) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      color: CupertinoColors.secondarySystemBackground,
                      width: double.infinity,
                    ),
                itemBuilder: (context, index) {
                  final item = cart.marketLists![index];
                  final product = item.product;
                  final price = (item.quantity ?? 1) * item.price!;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child:
                            product?.image != null
                                ? CustomCachedNetworkImage(
                                  imageUrl: product?.image ?? "",
                                  width: 56,
                                  height: 56,
                                  fit: BoxFit.cover,
                                )
                                : const NoImageWidget(height: 56, width: 56),
                      ),
                      12.horizontal,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.localizedTitle(
                                    item.product?.titleUz,
                                    item.product?.titleRu,
                                    item.product?.titleEn,
                                  ) ??
                                  item.productName ??
                                  "-",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "${"amount".tr()}: ${item.quantity} ${item.unit?.name ?? ""}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              "${"price".tr()}: ${item.price} ${"currency".tr()}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            if (cart.users != null &&
                                cart.users!.length > 1 &&
                                item.user?.fullName != null) ...[
                              4.vertical,
                              Text("👤${item.user!.fullName!}"),
                            ],
                          ],
                        ),
                      ),
                      Text(
                        "${price.toStringAsFixed(2)} ${"currency".tr()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
