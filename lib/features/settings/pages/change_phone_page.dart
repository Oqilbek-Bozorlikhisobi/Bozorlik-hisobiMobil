import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/widgets/keep_alive_page.dart';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:bozorlik/features/auth/notifiers/forgot_otp_notifier.dart';
import 'package:bozorlik/features/settings/notifiers/change_phone_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

import '../../../app/router.dart';
import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_phone_field.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/custom_toast.dart';

class ChangePhonePage extends HookConsumerWidget {
  const ChangePhonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useState(0);
    final isLoading = useState(false);
    final otpKey = useState("");
    final phoneNumber = useState("");

    final changePhoneNotifier = ref.watch(changePhoneNotifierProvider);

    final pageController = usePageController(keepPage: true);
    final phoneFormKey = useMemoized(() => GlobalKey<FormState>());
    final confirmationFormKey = useMemoized(() => GlobalKey<FormState>());

    final phoneController = useTextEditingController();
    final confirmationController = useTextEditingController();

    ref.listen(changePhoneNotifierProvider, (previous, next) {
      if (next.result != null) {
        context.pop();
      } else if (next.error != null &&
          next.error!.isNotEmpty &&
          previous?.error != next.error) {
        showCustomToast(title: next.error!, type: ToastificationType.error);
      }
    });

    void onPageChanged(int page) {
      confirmationController.clear();
      currentPage.value = page;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 4,
              width: currentPage.value == index ? 56 : 25,
              decoration: BoxDecoration(
                color:
                    currentPage.value == index
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
        leading: IconButton(
          onPressed: () {
            if (currentPage.value == 1) {
              pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            } else {
              context.pop();
            }
          },
          icon: SvgPicture.asset(AppIcons.back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: onPageChanged,
                children: [
                  KeepAlivePage(
                    child: Form(
                      key: phoneFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 16.vertical,
                          // SvgPicture.asset(AppIcons.logo, height: 20, width: 112),
                          12.vertical,
                          Text(
                            "enter_new_number".tr(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          8.vertical,
                          Text("verify_sms".tr()),
                          32.vertical,
                          CustomPhoneField(
                            validatorText: "please_enter_phone".tr(),
                            textCapitalization: TextCapitalization.none,
                            controller: phoneController,
                            onChange: (value) {
                              phoneNumber.value = value;
                            },
                            labelText: "phone".tr(),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 12),
                    ),
                  ),

                  Form(
                    key: confirmationFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 16.vertical,
                        // SvgPicture.asset(AppIcons.logo, height: 20, width: 112),
                        12.vertical,
                        Text(
                          "enter_code".tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        8.vertical,
                        Text("verify_phone".tr()),
                        32.vertical,
                        CustomTextField(
                          validatorText: "please_enter_code".tr(),
                          controller: confirmationController,
                          maxLength: 4,
                          textInputType: TextInputType.number,
                          labelText: "enter_code".tr(),
                          hintText: "----",
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 12),
                  ),
                ],
              ),
            ),
            if (currentPage.value == 1)
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  onPressed: () async {
                    if (changePhoneNotifier.resendAvailableIn != 0) return;
                    otpKey.value =
                        await ref
                            .read(changePhoneNotifierProvider.notifier)
                            .resendOtp(phone: phoneNumber.value) ??
                        "";
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "didnt_receive_code".tr(),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        changePhoneNotifier.resendAvailableIn > 0
                            ? "resend_in".tr(
                              args: [
                                changePhoneNotifier.resendAvailableIn
                                    .toString(),
                              ],
                            )
                            : "resend".tr(),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            6.vertical,
            CustomButton(
              isLoading:
                  (changePhoneNotifier.isLoading == true) || isLoading.value,
              text: "next".tr(),
              onTap: () async {
                if (currentPage.value == 0) {
                  if (phoneFormKey.currentState!.validate()) {
                    isLoading.value = true;
                    try {
                      final otp =
                          await ref
                              .read(changePhoneNotifierProvider.notifier)
                              .sendOtp(phoneNumber: phoneNumber.value) ??
                          "";
                      if (otp.isNotEmpty) {
                        otpKey.value = otp;
                        pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    } catch (e, s) {}
                    isLoading.value = false;
                  }
                } else {
                  if (confirmationFormKey.currentState!.validate()) {
                    ref
                        .read(changePhoneNotifierProvider.notifier)
                        .verifyOtp(
                          model: OtpState(
                            phoneNumber: phoneNumber.value,
                            otp: confirmationController.text,
                            verificationKey: otpKey.value,
                          ),
                        );
                  }
                }
              },
            ).paddingSymmetric(horizontal: 12),
            12.vertical,
          ],
        ),
      ),
    );
  }
}
