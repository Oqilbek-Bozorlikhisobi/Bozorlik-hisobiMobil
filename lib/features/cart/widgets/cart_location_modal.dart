import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/cart/repositories/cart_repository.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartLocationModal extends HookConsumerWidget {
  const CartLocationModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationController = useTextEditingController();

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
            "complete_shopping".tr(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          4.vertical,
          Text(
            "enter_market_name".tr(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          30.vertical,
          CustomTextField(
            labelText: "market_name".tr(),
            controller: locationController,
            focusNode: focusNode,
            hintText: "market_name_example".tr(),
          ),

          20.vertical,
          CustomButton(
            isLoading: isLoading.value,
            text: "finish".tr(),
            onTap: () async {
              isLoading.value = true;
              try {
                await ref
                    .read(cartNotifierProvider.notifier)
                    .finishCart(location: locationController.text);
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

  static Future show(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => CartLocationModal(),
    );
  }
}
