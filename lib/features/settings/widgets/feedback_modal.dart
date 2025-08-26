import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class FeedbackModal extends HookConsumerWidget {
  const FeedbackModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackController = useTextEditingController();

    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());

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
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "give_feedback".tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            4.vertical,
            Text(
              "tell_us_improvement".tr(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            30.vertical,
            CustomTextField(
              validatorText: "required_field".tr(),
              labelText: "questions_suggestions".tr(),
              controller: feedbackController,
              focusNode: focusNode,
              hintText: "questions_suggestions".tr(),
            ),

            20.vertical,
            CustomButton(
              isLoading: isLoading.value,
              text: "send".tr(),
              onTap: () async {
                if (!formKey.currentState!.validate()) return;
                isLoading.value = true;
                try {
                  await profileRepository.sendFeedback(
                    feedback: feedbackController.text,
                  );
                  showCustomToast(title: "success_sent".tr());
                  if (context.mounted) {
                    Navigator.pop(context, true);
                  }
                } catch (e, s) {
                  showCustomToast(
                    title: "something_went_wrong".tr(),
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

  static Future show(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => FeedbackModal(),
    );
  }
}
