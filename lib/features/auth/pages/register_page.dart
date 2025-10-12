// import 'package:bozorlik/common/extension/number_extension.dart';
// import 'package:bozorlik/common/extension/widget_extantion.dart';
// import 'package:bozorlik/common/widgets/custom_dropdown.dart';
// import 'package:bozorlik/common/widgets/custom_toast.dart';
// import 'package:bozorlik/common/widgets/keep_alive_page.dart';
// import 'package:bozorlik/features/auth/models/otp_state.dart';
// import 'package:bozorlik/features/auth/notifiers/register_notifier.dart';
// import 'package:bozorlik/features/auth/notifiers/register_otp_notifier.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:toastification/toastification.dart';
//
// import '../../../app/router.dart';
// import '../../../app/theme.dart';
// import '../../../common/values/app_assets.dart';
// import '../../../common/widgets/custom_button.dart';
// import '../../../common/widgets/custom_phone_field.dart';
// import '../../../common/widgets/custom_text_field.dart';
//
// class RegisterPage extends HookConsumerWidget {
//   const RegisterPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     const regions = [
//       "Toshkent V",
//       "Toshkent Sh",
//       "Samarqand",
//       "Buxoro",
//       "Andijon",
//       "Namangan",
//       "Farg‘ona",
//       "Xorazm",
//       "Navoiy",
//       "Surxondaryo",
//       "Qashqadaryo",
//       "Sirdaryo",
//       "Jizzax",
//       "Qoraqalpog‘iston",
//     ];
//     final currentPage = useState(0);
//     final isLoading = useState(false);
//     final otpKey = useState("");
//     final gender = useState<String?>(null);
//
//     final registerNotifier = ref.watch(registerNotifierProvider.notifier);
//     final registerState = ref.watch(registerNotifierProvider);
//     final registerOtp = ref.watch(registerOtpNotifierProvider);
//
//     final pageController = usePageController(keepPage: true);
//     final phoneFormKey = useMemoized(() => GlobalKey<FormState>());
//     final datasFormKey = useMemoized(() => GlobalKey<FormState>());
//     final confirmationFormKey = useMemoized(() => GlobalKey<FormState>());
//
//     final phoneController = useTextEditingController();
//     final passwordController = useTextEditingController();
//     final confirmPasswordController = useTextEditingController();
//
//     final nameController = useTextEditingController();
//     final regionController = useTextEditingController();
//     final genderController = useTextEditingController();
//
//     final confirmationController = useTextEditingController();
//
//     ref.listen(registerOtpNotifierProvider, (previous, next) {
//       if (next.result != null) {
//         context.go(AppRoutes.main);
//       } else if (next.error != null && next.error!.isNotEmpty && previous?.error != next.error) {
//         showCustomToast(title: next.error!, type: ToastificationType.error);
//       }
//     });
//
//     void onPageChanged(int page) {
//       currentPage.value = page;
//     }
//
//     return Scaffold(
//       backgroundColor: AppColors.backGround,
//
//       appBar: AppBar(
//         backgroundColor: AppColors.backGround,
//         // centerTitle: true,
//         title: Text("register".tr(), style: ThemeData().textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
//         // title: Row(
//         //   mainAxisSize: MainAxisSize.min,
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: List.generate(3, (index) {
//         //     return AnimatedContainer(
//         //       duration: const Duration(milliseconds: 300),
//         //       margin: const EdgeInsets.symmetric(horizontal: 4),
//         //       height: 4,
//         //       width: currentPage.value == index ? 56 : 25,
//         //       decoration: BoxDecoration(
//         //         color:
//         //             currentPage.value == index
//         //                 ? Theme.of(context).colorScheme.primaryContainer
//         //                 : Colors.grey[300],
//         //         borderRadius: BorderRadius.circular(2),
//         //       ),
//         //     );
//         //   }),
//         // ),
//         leading: IconButton(
//           onPressed: () {
//             if (currentPage.value == 2) {
//               pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//             } else if (currentPage.value == 1) {
//               pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//             } else {
//               context.pop();
//             }
//           },
//           icon: SvgPicture.asset(AppIcons.back),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               flex: 4,
//               child: PageView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 controller: pageController,
//                 onPageChanged: onPageChanged,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 16),
//                         decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
//                         child: KeepAlivePage(
//                           child: Form(
//                             key: phoneFormKey,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 24.vertical,
//                                 CustomPhoneField(
//                                   validatorText: "please_enter_phone".tr(),
//                                   textCapitalization: TextCapitalization.none,
//                                   controller: phoneController,
//                                   onChange: (value) {
//                                     registerNotifier.changePhoneNumber(value);
//                                   },
//                                   labelText: "phone".tr(),
//                                 ),
//                                 12.vertical,
//                                 CustomTextField(
//                                   validatorText: "please_enter_password".tr(),
//                                   labelText: "enter_password".tr(),
//                                   isObscure: true,
//
//                                   textInputType: TextInputType.visiblePassword,
//                                   onChange: (value) {
//                                     registerNotifier.changePassword(value);
//                                   },
//                                   controller: passwordController,
//                                   hintText: "password".tr(),
//                                 ),
//                                 12.vertical,
//                                 CustomTextField(
//                                   validator: (value) {
//                                     if (value != passwordController.text) {
//                                       return "passwords_not_match".tr();
//                                     }
//                                     return null;
//                                   },
//                                   controller: confirmPasswordController,
//                                   labelText: "reenter_password".tr(),
//                                   textInputType: TextInputType.visiblePassword,
//                                   onChange: (value) {
//                                     registerNotifier.changeConfirmPassword(value);
//                                   },
//                                   isObscure: true,
//                                   hintText: "password".tr(),
//                                 ),
//                                 24.vertical,
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         context.pop();
//                                       },
//                                       child: Text(
//                                         "yes_account".tr(),
//                                         style: TextStyle(
//                                           wordSpacing: 1,
//                                           decorationColor: AppColors.primaryColor,
//                                           decoration: TextDecoration.underline,
//                                           color: AppColors.primaryColor,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 16.vertical,
//                                 CustomButton(
//                                   isLoading: (registerOtp.isLoading == true) || isLoading.value,
//                                   text: "next".tr(),
//                                   onTap: () async {
//                                     if (currentPage.value == 0) {
//                                       if (phoneFormKey.currentState!.validate()) {
//                                         pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//                                       }
//                                     } else if (currentPage.value == 1) {
//                                       if (datasFormKey.currentState!.validate()) {
//                                         isLoading.value = true;
//                                         try {
//                                           final key = await registerNotifier.post();
//                                           otpKey.value = key;
//                                           isLoading.value = false;
//                                           ref.read(registerOtpNotifierProvider.notifier).startResendTimer();
//                                           pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//                                         } catch (e, s) {
//                                           showCustomToast(title: "something_went_wrong".tr(), type: ToastificationType.error);
//
//                                           isLoading.value = false;
//                                         }
//                                       }
//                                     } else {
//                                       if (confirmationFormKey.currentState!.validate()) {
//                                         ref
//                                             .read(registerOtpNotifierProvider.notifier)
//                                             .verifyOtp(
//                                               model: OtpState(
//                                                 phoneNumber: registerState.phoneNumber,
//                                                 otp: confirmationController.text,
//                                                 verificationKey: otpKey.value,
//                                               ),
//                                             );
//                                       }
//                                     }
//                                   },
//                                 ),
//                                 16.vertical,
//                               ],
//                             ).paddingSymmetric(horizontal: 12),
//                           ),
//                         ),
//                       ),
//                       SizedBox(),
//                     ],
//                   ),
//                   Form(
//                     key: datasFormKey,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             margin: EdgeInsets.symmetric(horizontal: 16),
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
//                             child: Column(
//                               children: [
//                                 // SvgPicture.asset(AppIcons.user),
//                                 SvgPicture.asset(AppIcons.user),
//                                 Text(
//                                   "your_self".tr(),
//                                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           16.vertical,
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 16),
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // 16.vertical,
//                                 // SvgPicture.asset(AppIcons.logo, height: 20, width: 112),
//                                 // 12.vertical,
//                                 // Text("enter_additional_info".tr(), style: Theme.of(context).textTheme.titleLarge),
//                                 // 8.vertical,
//                                 // Text("tell_more".tr()),
//                                 24.vertical,
//                                 CustomTextField(
//                                   validatorText: "please_enter_fullname".tr(),
//                                   controller: nameController,
//                                   textInputType: TextInputType.text,
//
//                                   onChange: (value) {
//                                     registerNotifier.changeFullName(value);
//                                   },
//                                   labelText: "enter_fullname".tr(),
//                                   hintText: "full_name".tr(),
//                                 ),
//                                 12.vertical,
//                                 Text(
//                                   "region".tr(),
//                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
//                                 ),
//                                 8.vertical,
//                                 Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.white,
//                                     borderRadius: BorderRadius.circular(12),
//                                     border: Border.all(width: 2, color: CupertinoColors.systemGroupedBackground),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('Toshkent V', style: TextStyle(fontSize: 16, color: Colors.black87)),
//                                       Icon(Icons.keyboard_arrow_down, color: Colors.grey),
//                                     ],
//                                   ),
//                                 ),
//                                 // CustomDropdown(
//                                 //   validatorText: "please_select_region".tr(),
//                                 //   height: 400,
//                                 //   selectedValue: registerState.region,
//                                 //   onChanged: (value) {
//                                 //     registerNotifier.changeRegion(value ?? "");
//                                 //   },
//                                 //   labelText: "select_region".tr(),
//                                 //   hintText: "region".tr(),
//                                 //   items: regions,
//                                 // ),
//                                 12.vertical,
//                                 CustomDropdown(
//                                   validatorText: "please_select_gender".tr(),
//                                   selectedValue: gender.value,
//                                   onChanged: (value) {
//                                     gender.value = value;
//                                     final genderEn = value == "female".tr() ? "Female" : "Male";
//                                     registerNotifier.changeGender(genderEn);
//                                   },
//                                   labelText: "select_gender".tr(),
//                                   hintText: "gender".tr(),
//                                   items: ["male".tr(), "female".tr()],
//                                 ),
//
//                                 24.vertical,
//
//                                 CustomButton(
//                                   isLoading: (registerOtp.isLoading == true) || isLoading.value,
//                                   text: "next".tr(),
//                                   onTap: () async {
//                                     if (currentPage.value == 0) {
//                                       if (phoneFormKey.currentState!.validate()) {
//                                         pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//                                       }
//                                     } else if (currentPage.value == 1) {
//                                       if (datasFormKey.currentState!.validate()) {
//                                         isLoading.value = true;
//                                         try {
//                                           final key = await registerNotifier.post();
//                                           otpKey.value = key;
//                                           isLoading.value = false;
//                                           ref.read(registerOtpNotifierProvider.notifier).startResendTimer();
//                                           pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//                                         } catch (e, s) {
//                                           showCustomToast(title: "something_went_wrong".tr(), type: ToastificationType.error);
//
//                                           isLoading.value = false;
//                                         }
//                                       }
//                                     } else {
//                                       if (confirmationFormKey.currentState!.validate()) {
//                                         ref
//                                             .read(registerOtpNotifierProvider.notifier)
//                                             .verifyOtp(
//                                               model: OtpState(
//                                                 phoneNumber: registerState.phoneNumber,
//                                                 otp: confirmationController.text,
//                                                 verificationKey: otpKey.value,
//                                               ),
//                                             );
//                                       }
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ).paddingSymmetric(horizontal: 12),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Form(
//                     key: confirmationFormKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // 16.vertical,
//                         // SvgPicture.asset(AppIcons.logo, height: 20, width: 112),
//                         12.vertical,
//                         Text("enter_code".tr(), style: Theme.of(context).textTheme.titleLarge),
//                         8.vertical,
//                         Text("verify_phone".tr()),
//                         32.vertical,
//
//                         CustomTextField(
//                           validatorText: "please_enter_code".tr(),
//                           controller: confirmationController,
//                           maxLength: 4,
//                           textInputType: TextInputType.number,
//                           labelText: "enter_code_only".tr(),
//                           hintText: "----",
//                         ),
//                       ],
//                     ).paddingSymmetric(horizontal: 12),
//                   ),
//                 ],
//               ),
//             ),
//             if (currentPage.value == 2)
//               Center(
//                 child: CupertinoButton(
//                   padding: EdgeInsets.zero,
//                   minSize: 0,
//                   onPressed: () async {
//                     if (registerOtp.resendAvailableIn != 0) return;
//                     otpKey.value =
//                         await ref
//                             .read(registerOtpNotifierProvider.notifier)
//                             .resendOtp(
//                               model: OtpState(
//                                 phoneNumber: registerState.phoneNumber,
//                                 otp: confirmationController.text,
//                                 verificationKey: otpKey.value,
//                               ),
//                             ) ??
//                         "";
//                   },
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text("didnt_receive_code".tr(), style: TextStyle(color: AppColors.primaryColor, fontSize: 16, fontWeight: FontWeight.w600)),
//
//                       Text(
//                         registerOtp.resendAvailableIn > 0 ? "resend_in".tr(args: [registerOtp.resendAvailableIn.toString()]) : "resend".tr(),
//                         style: TextStyle(
//                           color: AppColors.primaryColor,
//                           fontSize: 16,
//                           decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             // Expanded(child: SizedBox())
//             // 6.vertical,
//             // (currentPage.value == 1 || currentPage.value == 2)
//             //     ? CustomButton(
//             //       isLoading: (registerOtp.isLoading == true) || isLoading.value,
//             //       text: "next".tr(),
//             //       onTap: () async {
//             //         if (currentPage.value == 0) {
//             //           if (phoneFormKey.currentState!.validate()) {
//             //             pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//             //           }
//             //         } else if (currentPage.value == 1) {
//             //           if (datasFormKey.currentState!.validate()) {
//             //             isLoading.value = true;
//             //             try {
//             //               final key = await registerNotifier.post();
//             //               otpKey.value = key;
//             //               isLoading.value = false;
//             //               ref.read(registerOtpNotifierProvider.notifier).startResendTimer();
//             //               pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//             //             } catch (e, s) {
//             //               showCustomToast(title: "something_went_wrong".tr(), type: ToastificationType.error);
//             //
//             //               isLoading.value = false;
//             //             }
//             //           }
//             //         } else {
//             //           if (confirmationFormKey.currentState!.validate()) {
//             //             ref
//             //                 .read(registerOtpNotifierProvider.notifier)
//             //                 .verifyOtp(
//             //                   model: OtpState(
//             //                     phoneNumber: registerState.phoneNumber,
//             //                     otp: confirmationController.text,
//             //                     verificationKey: otpKey.value,
//             //                   ),
//             //                 );
//             //           }
//             //         }
//             //       },
//             //     ).paddingSymmetric(horizontal: 12)
//             //     : Expanded(child: SizedBox()),
//             // 12.vertical,
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/widgets/custom_dropdown.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/common/widgets/keep_alive_page.dart';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:bozorlik/features/auth/notifiers/register_notifier.dart';
import 'package:bozorlik/features/auth/notifiers/register_otp_notifier.dart';
import 'package:bozorlik/utils/mask.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toastification/toastification.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_phone_field.dart';
import '../../../common/widgets/custom_text_field.dart';
import 'components/select_region_bottomsheet.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      } else if (next.error != null && next.error!.isNotEmpty && previous?.error != next.error) {
        showCustomToast(title: next.error!, type: ToastificationType.error);
      }
    });

    void onPageChanged(int page) {
      currentPage.value = page;
    }

    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        title: Text(
          currentPage.value == 0
              ? "register".tr()
              : currentPage.value == 1
              ? "additional_info".tr()
              : currentPage.value == 2
              ? "enter_code".tr()
              : "",
          style: ThemeData().textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            if (currentPage.value == 2) {
              pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
            } else if (currentPage.value == 1) {
              pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
            } else {
              context.pop();
            }
          },
          icon: SvgPicture.asset(AppIcons.back),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: onPageChanged,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                        child: KeepAlivePage(
                          child: Form(
                            key: phoneFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                24.vertical,
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
                                24.vertical,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.pop();
                                      },
                                      child: Text(
                                        "yes_account".tr(),
                                        style: TextStyle(
                                          wordSpacing: 1,
                                          decorationColor: AppColors.primaryColor,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                16.vertical,
                                CustomButton(
                                  isLoading: (registerOtp.isLoading == true) || isLoading.value,
                                  text: "log_in".tr(),
                                  onTap: () async {
                                    if (currentPage.value == 0) {
                                      if (phoneFormKey.currentState!.validate()) {
                                        pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                      }
                                    } else if (currentPage.value == 1) {
                                      if (datasFormKey.currentState!.validate()) {
                                        isLoading.value = true;
                                        try {
                                          final key = await registerNotifier.post();
                                          otpKey.value = key;
                                          isLoading.value = false;
                                          ref.read(registerOtpNotifierProvider.notifier).startResendTimer();
                                          pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                        } catch (e) {
                                          showCustomToast(title: "something_went_wrong".tr(), type: ToastificationType.error);
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
                                ),
                                16.vertical,
                              ],
                            ).paddingSymmetric(horizontal: 12),
                          ),
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                  Form(
                    key: datasFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                SvgPicture.asset(AppIcons.user),
                                Text(
                                  "your_self".tr(),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          16.vertical,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                24.vertical,
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
                                Text(
                                  "region".tr(),
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                                8.vertical,
                                FormField<String>(
                                  validator: (value) {
                                    if (registerState.region?.isEmpty ?? false) {
                                      return "please_select_region".tr();
                                    }
                                    return null;
                                  },
                                  builder: (formFieldState) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () => showRegionBottomSheet(context, registerNotifier, registerState),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                width: 2,
                                                color: formFieldState.hasError ? Colors.red : CupertinoColors.systemGroupedBackground,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  (registerState.region?.isEmpty ?? false)
                                                      ? 'region'.tr()
                                                      : registerState.region ?? "select_region".tr(),
                                                  style: TextStyle(fontSize: 16, color: Colors.black87),
                                                ),
                                                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (formFieldState.hasError)
                                          Padding(
                                            padding: EdgeInsets.only(left: 12, top: 4),
                                            child: Text(formFieldState.errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                                12.vertical,
                                Text(
                                  "your_gender".tr(),
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                                8.vertical,
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          gender.value = "male".tr();
                                          registerNotifier.changeGender("Male");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 7),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(
                                              width: 2,
                                              color: gender.value == "male".tr() ? AppColors.primaryColor : CupertinoColors.systemGroupedBackground,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "male".tr(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: gender.value == "male".tr() ? AppColors.primaryColor : Colors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    12.horizontal,
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          gender.value = "female".tr();
                                          registerNotifier.changeGender("Female");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 7),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(
                                              width: 2,
                                              color: gender.value == "female".tr() ? AppColors.primaryColor : CupertinoColors.systemGroupedBackground,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "female".tr(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: gender.value == "female".tr() ? AppColors.primaryColor : Colors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // 12.vertical,
                                // CustomDropdown(
                                //   validatorText: "please_select_gender".tr(),
                                //   selectedValue: gender.value,
                                //   onChanged: (value) {
                                //     gender.value = value;
                                //     final genderEn = value == "female".tr() ? "Female" : "Male";
                                //     registerNotifier.changeGender(genderEn);
                                //   },
                                //   labelText: "select_gender".tr(),
                                //   hintText: "gender".tr(),
                                //   items: ["male".tr(), "female".tr()],
                                // ),
                                24.vertical,
                                CustomButton(
                                  isLoading: (registerOtp.isLoading == true) || isLoading.value,
                                  text: "log_in".tr(),
                                  onTap: () async {
                                    if (currentPage.value == 0) {
                                      if (phoneFormKey.currentState!.validate()) {
                                        pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                      }
                                    } else if (currentPage.value == 1) {
                                      if (datasFormKey.currentState!.validate()) {
                                        isLoading.value = true;
                                        try {
                                          final key = await registerNotifier.post();
                                          otpKey.value = key;
                                          isLoading.value = false;
                                          ref.read(registerOtpNotifierProvider.notifier).startResendTimer();
                                          pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                        } catch (e, s) {
                                          showCustomToast(title: "something_went_wrong".tr(), type: ToastificationType.error);
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
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: confirmationFormKey,
                    child: Column(
                      children: [
                        if (currentPage.value == 2)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),

                            child: Column(
                              children: [
                                SvgPicture.asset(AppIcons.mail),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        "+998${maskPhoneNumber(phoneController.text)}${"number_send".tr()}",
                                      ),
                                    ),
                                  ],
                                ),
                                16.vertical,
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: CustomButton(
                                    textColor: registerOtp.resendAvailableIn != 0 ? AppColors.greyText : AppColors.white,
                                    bgColor: registerOtp.resendAvailableIn != 0 ? AppColors.grey : AppColors.primaryColor,
                                    text:
                                        registerOtp.resendAvailableIn > 0
                                            ? "${"resend".tr()} 00:${registerOtp.resendAvailableIn.toString()}"
                                            : "resend".tr(),
                                    onTap: () async {
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
                                  ),
                                ),
                                // Center(
                                //   child: CupertinoButton(
                                //     padding: EdgeInsets.zero,
                                //     minSize: 0,
                                //     onPressed: () async {
                                //       if (registerOtp.resendAvailableIn != 0) return;
                                //       otpKey.value =
                                //           await ref
                                //               .read(registerOtpNotifierProvider.notifier)
                                //               .resendOtp(
                                //                 model: OtpState(
                                //                   phoneNumber: registerState.phoneNumber,
                                //                   otp: confirmationController.text,
                                //                   verificationKey: otpKey.value,
                                //                 ),
                                //               ) ??
                                //           "";
                                //     },
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         Text(
                                //           "didnt_receive_code".tr(),
                                //           style: TextStyle(color: AppColors.primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                                //         ),
                                //         Text(
                                //           registerOtp.resendAvailableIn > 0
                                //               ? "resend_in".tr(args: [registerOtp.resendAvailableIn.toString()])
                                //               : "resend".tr(),
                                //           style: TextStyle(
                                //             color: AppColors.primaryColor,
                                //             fontSize: 16,
                                //             decoration: TextDecoration.underline,
                                //             fontWeight: FontWeight.w600,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),

                        24.vertical,

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 12.vertical,
                              // Text("enter_code".tr(), style: Theme.of(context).textTheme.titleLarge),
                              // 8.vertical,
                              // Text("verify_phone".tr()),
                              // 32.vertical,
                              CustomTextField(
                                validatorText: "please_enter_code".tr(),
                                controller: confirmationController,
                                maxLength: 4,
                                textInputType: TextInputType.number,
                                // labelText: "enter_code_only".tr(),
                                hintText: "----",
                              ),
                              24.vertical,

                              CustomButton(
                                isLoading: (registerOtp.isLoading == true) || isLoading.value,
                                text: "log_in".tr(),
                                onTap: () async {
                                  if (currentPage.value == 0) {
                                    if (phoneFormKey.currentState!.validate()) {
                                      pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                    }
                                  } else if (currentPage.value == 1) {
                                    if (datasFormKey.currentState!.validate()) {
                                      isLoading.value = true;
                                      try {
                                        final key = await registerNotifier.post();
                                        otpKey.value = key;
                                        isLoading.value = false;
                                        ref.read(registerOtpNotifierProvider.notifier).startResendTimer();
                                        pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                      } catch (e, s) {
                                        showCustomToast(title: "something_went_wrong".tr(), type: ToastificationType.error);
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
                              ),
                              12.vertical,
                            ],
                          ).paddingSymmetric(horizontal: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
