import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/custom_phone_field.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class CartShareModal extends HookConsumerWidget {
  const CartShareModal({super.key, required this.marketId});

  final String marketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final phoneNumber = useState("");
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final isLoading = useState(false);
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "invitation_number".tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            // 4.vertical,
            // Text(
            //   "enter_user_phone".tr(),
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            // ),
            16.vertical,
            CustomPhoneField(
              onChange: (value) {
                phoneNumber.value = value;
              },
              validatorText: "enter_phone_number".tr(),
              labelText: "user_phone".tr(),
              controller: phoneController,
            ),
            16.vertical,
            CustomTextField(
              onChange: (value) {
                // phoneNumber.value = value;
              },
              hintText: "...",
              labelText: "description".tr(),
              controller: descriptionController,
            ),
            20.vertical,
            CustomButton(
              isLoading: isLoading.value,
              text: "share".tr(),
              onTap: () async {
                isLoading.value = true;
                try {
                  await ref
                      .read(cartNotifierProvider.notifier)
                      .shareCart(
                        phoneNumber: phoneNumber.value,
                        description: descriptionController.text,
                        marketId: marketId,
                      );
                  showCustomToast(title: "success_sent".tr());
                  if (context.mounted) {
                    Navigator.pop(context, true);
                  }
                } catch (e, s) {
                  showCustomToast(
                    title: "user_not_found".tr(),
                    type: ToastificationType.error,
                  );

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
      ),
    );
  }

  static Future show(BuildContext context, {required String marketId}) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => CartShareModal(marketId: marketId),
    );
  }
}
