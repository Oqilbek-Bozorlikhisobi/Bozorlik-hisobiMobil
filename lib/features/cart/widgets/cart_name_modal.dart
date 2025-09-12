import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/cart/notifiers/all_carts_notifier.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/cart/repositories/cart_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartNameModal extends HookConsumerWidget {
  const CartNameModal({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: cart.name);

    final isLoading = useState(false);

    final focusNode = useFocusNode();
    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, [0]);
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "update_shopping_list_name".tr(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          4.vertical,
          Text(
            "enter_new_name".tr(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          30.vertical,
          CustomTextField(
            labelText: "market_name".tr(),
            controller: nameController,
            focusNode: focusNode,
            hintText: "market_name_example".tr(),
          ),

          20.vertical,
          CustomButton(
            isLoading: isLoading.value,
            text: "finish".tr(),
            onTap: () async {
              if (cart.id == null) return;
              isLoading.value = true;
              try {
                await cartRepository.updateCart(
                  name: nameController.text,
                  cartId: cart.id!,
                  location: cart.location,
                );
                ref.invalidate(allCartsNotifierProvider);
                if (context.mounted) {
                  Navigator.pop(context, true);
                }
              } catch (e, s) {
                if (context.mounted) {
                  Navigator.pop(context, false);
                }
              }
              isLoading.value = false;
            },
          ),
          30.vertical,
        ],
      ),
    );
  }

  static Future show(BuildContext context, CartModel cart) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => CartNameModal(cart: cart),
    );
  }
}
