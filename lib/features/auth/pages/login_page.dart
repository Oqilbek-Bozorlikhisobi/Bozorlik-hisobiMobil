import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/widgets/custom_phone_field.dart';
import 'package:bozorlik/common/widgets/custom_scaffold_loading.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

import '../../../app/router.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../notifiers/login_notifier.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final phone = useState("");
    final passwordController = useTextEditingController();
    final loginNotifier = ref.watch(loginNotifierProvider);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    ref.listen(loginNotifierProvider, (previous, next) {
      next.when(
        data: (data) async {
          if (data != null) {
            showCustomToast(title: "login_success".tr());
            await Future.delayed(Duration(seconds: 1));
            if (context.mounted) {
              context.go(AppRoutes.main);
            }
          }
        },
        error: (e, s) {
          showCustomToast(
            title: "invalid_login".tr(),
            type: ToastificationType.error,
          );
        },
        loading: () {},
      );
    });
    return CustomScaffoldLoading(
      isLoading: loginNotifier.isLoading,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 16.vertical,
                // SvgPicture.asset(AppIcons.logo, height: 112, width: 112),
                12.vertical,
                Text(
                  "log_in".tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                8.vertical,
                Text("please_enter_login_info".tr()),
                32.vertical,
                CustomPhoneField(
                  labelText: "phone".tr(),
                  onChange: (value) {
                    phone.value = value;
                  },
                  validatorText: "required_field".tr(),
                  controller: phoneController,
                  textCapitalization: TextCapitalization.none,
                ),
                12.vertical,
                CustomTextField(
                  controller: passwordController,
                  labelText: "password".tr(),
                  validatorText: "required_field".tr(),
                  textCapitalization: TextCapitalization.none,
                  hintText: "password".tr(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push(AppRoutes.forgotPassword);
                    },
                    child: Text("forgot_password".tr()),
                  ),
                ),
                Spacer(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.push(AppRoutes.register);
                    },
                    child: Text("no_account_yet".tr()),
                  ),
                ),
                6.vertical,
                CustomButton(
                  text: "log_in".tr(),
                  onTap: () {
                    if (formKey.currentState?.validate() == false) return;

                    ref
                        .read(loginNotifierProvider.notifier)
                        .login(
                          phone: phone.value,
                          password: passwordController.text,
                        );
                  },
                ),
                12.vertical,
              ],
            ).paddingSymmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
