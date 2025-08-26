import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/widgets/custom_dropdown.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/common/widgets/keep_alive_page.dart';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:bozorlik/features/auth/notifiers/register_notifier.dart';
import 'package:bozorlik/features/auth/notifiers/register_otp_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_phone_field.dart';
import '../../../common/widgets/custom_text_field.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const regions = [
      "Toshkent V",
      "Toshkent Sh",
      "Samarqand",
      "Buxoro",
      "Andijon",
      "Namangan",
      "Farg‘ona",
      "Xorazm",
      "Navoiy",
      "Surxondaryo",
      "Qashqadaryo",
      "Sirdaryo",
      "Jizzax",
      "Qoraqalpog‘iston",
    ];
    final currentPage = useState(0);
    final isLoading = useState(false);
    final otpKey = useState("");
    final gender = useState<String?>(null);

    final registerNotifier = ref.watch(registerNotifierProvider.notifier);
    final registerState = ref.watch(registerNotifierProvider);
    final registerOtp = ref.watch(registerOtpNotifierProvider);

    final pageController = usePageController(keepPage: true);
    final phoneFormKey = useMemoized(() => GlobalKey<FormState>());
    final datasFormKey = useMemoized(() => GlobalKey<FormState>());
    final confirmationFormKey = useMemoized(() => GlobalKey<FormState>());

    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final nameController = useTextEditingController();
    final regionController = useTextEditingController();
    final genderController = useTextEditingController();

    final confirmationController = useTextEditingController();

    ref.listen(registerOtpNotifierProvider, (previous, next) {
      if (next.result != null) {
        context.go(AppRoutes.main);
      } else if (next.error != null &&
          next.error!.isNotEmpty &&
          previous?.error != next.error) {
        showCustomToast(title: next.error!, type: ToastificationType.error);
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
          children: List.generate(3, (index) {
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
            if (currentPage.value == 2) {
              pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            } else if (currentPage.value == 1) {
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
                              registerNotifier.changePhoneNumber(value);
                            },
                            labelText: "phone".tr(),
                          ),
                          12.vertical,
                          CustomTextField(
                            validatorText: "please_enter_password".tr(),
                            labelText: "enter_password".tr(),
                            isObscure: true,

                            textInputType: TextInputType.visiblePassword,
                            onChange: (value) {
                              registerNotifier.changePassword(value);
                            },
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
                            onChange: (value) {
                              registerNotifier.changeConfirmPassword(value);
                            },
                            isObscure: true,
                            hintText: "password".tr(),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 12),
                    ),
                  ),
                  Form(
                    key: datasFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 16.vertical,
                        // SvgPicture.asset(AppIcons.logo, height: 20, width: 112),
                        12.vertical,
                        Text(
                          "enter_additional_info".tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        8.vertical,
                        Text("tell_more".tr()),
                        32.vertical,
                        CustomTextField(
                          validatorText: "please_enter_fullname".tr(),
                          controller: nameController,
                          textInputType: TextInputType.text,

                          onChange: (value) {
                            registerNotifier.changeFullName(value);
                          },
                          labelText: "enter_fullname".tr(),
                          hintText: "full_name".tr(),
                        ),
                        12.vertical,
                        CustomDropdown(
                          validatorText: "please_select_gender".tr(),
                          selectedValue: gender.value,
                          onChanged: (value) {
                            gender.value = value;
                            final genderEn =
                                value == "female".tr() ? "Female" : "Male";
                            registerNotifier.changeGender(genderEn);
                          },
                          labelText: "select_gender".tr(),
                          hintText: "gender".tr(),
                          items: ["male".tr(), "female".tr()],
                        ),
                        12.vertical,
                        CustomDropdown(
                          validatorText: "please_select_region".tr(),
                          height: 400,
                          selectedValue: registerState.region,
                          onChanged: (value) {
                            registerNotifier.changeRegion(value ?? "");
                          },
                          labelText: "select_region".tr(),
                          hintText: "region".tr(),
                          items: regions,
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
                          labelText: "enter_code_only".tr(),
                          hintText: "----",
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 12),
                  ),
                ],
              ),
            ),
            if (currentPage.value == 2)
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  onPressed: () async {
                    if (registerOtp.resendAvailableIn != 0) return;
                    otpKey.value =
                        await ref
                            .read(registerOtpNotifierProvider.notifier)
                            .resendOtp(
                              model: OtpState(
                                phoneNumber: registerState.phoneNumber,
                                otp: confirmationController.text,
                                verificationKey: otpKey.value,
                              ),
                            ) ??
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
                        registerOtp.resendAvailableIn > 0
                            ? "resend_in".tr(
                              args: [registerOtp.resendAvailableIn.toString()],
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
              isLoading: (registerOtp.isLoading == true) || isLoading.value,
              text: "next".tr(),
              onTap: () async {
                if (currentPage.value == 0) {
                  if (phoneFormKey.currentState!.validate()) {
                    pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                } else if (currentPage.value == 1) {
                  if (datasFormKey.currentState!.validate()) {
                    isLoading.value = true;
                    try {
                      final key = await registerNotifier.post();
                      otpKey.value = key;
                      isLoading.value = false;
                      pageController.animateToPage(
                        2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    } catch (e, s) {
                      showCustomToast(
                        title: "something_went_wrong".tr(),
                        type: ToastificationType.error,
                      );

                      isLoading.value = false;
                    }
                  }
                } else {
                  if (confirmationFormKey.currentState!.validate()) {
                    ref
                        .read(registerOtpNotifierProvider.notifier)
                        .verifyOtp(
                          model: OtpState(
                            phoneNumber: registerState.phoneNumber,
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
