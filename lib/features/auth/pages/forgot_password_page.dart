import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:bozorlik/features/auth/notifiers/forgot_otp_notifier.dart';
import 'package:bozorlik/features/auth/notifiers/register_notifier.dart';
import 'package:bozorlik/features/auth/notifiers/register_otp_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_phone_field.dart';
import '../../../common/widgets/custom_text_field.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useState(0);
    final isLoading = useState(false);
    final otpKey = useState("");
    final phoneNumber = useState("");

    final forgotOtp = ref.watch(forgotOtpNotifierProvider);

    final pageController = usePageController(keepPage: true);
    final phoneFormKey = useMemoized(() => GlobalKey<FormState>());
    final confirmationFormKey = useMemoized(() => GlobalKey<FormState>());

    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final confirmationController = useTextEditingController();

    ref.listen(forgotOtpNotifierProvider, (previous, next) {
      if (next.result != null) {
        context.go(AppRoutes.login);
      }
    });

    void onPageChanged(int page) {
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
                  Form(
                    key: phoneFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 16.vertical,
                        // SvgPicture.asset(AppIcons.logo, height: 20, width: 112),
                        12.vertical,
                        Text(
                          "enter_phone".tr(),
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
                        12.vertical,
                        CustomTextField(
                          validatorText: "please_enter_password".tr(),
                          labelText: "enter_password".tr(),
                          isObscure: true,

                          textInputType: TextInputType.visiblePassword,

                          controller: passwordController,
                          hintText: "password".tr(),
                        ),
                        12.vertical,
                        CustomTextField(
                          validator: (value) {
                            if (value != passwordController.text) {
                              return "passwords_not_match".tr();
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          labelText: "reenter_password".tr(),
                          textInputType: TextInputType.visiblePassword,

                          isObscure: true,
                          hintText: "password".tr(),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 12),
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
            6.vertical,
            CustomButton(
              isLoading: (forgotOtp.isLoading == true) || isLoading.value,
              text: "next".tr(),
              onTap: () async {
                if (currentPage.value == 0) {
                  if (phoneFormKey.currentState!.validate()) {
                    isLoading.value = true;
                    otpKey.value = await ref
                        .read(forgotOtpNotifierProvider.notifier)
                        .sendOtp(
                          phoneNumber: phoneNumber.value,
                          password: passwordController.text,
                        );
                    isLoading.value = false;
                    pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                } else {
                  if (confirmationFormKey.currentState!.validate()) {
                    ref
                        .read(forgotOtpNotifierProvider.notifier)
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
