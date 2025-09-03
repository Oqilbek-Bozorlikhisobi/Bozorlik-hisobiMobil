import 'package:bozorlik/app/app.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/values/app_infos.dart';
import 'package:bozorlik/common/widgets/custom_error_widget.dart';
import 'package:bozorlik/common/widgets/custom_scaffold_loading.dart';
import 'package:bozorlik/features/settings/widgets/feedback_modal.dart';
import 'package:bozorlik/features/settings/widgets/settings_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/loading_widget.dart';
import '../../auth/notifiers/login_notifier.dart';
import '../notifiers/profile_notifier.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileNotifier = ref.watch(profileNotifierProvider);
    final isLoading = useState(false);
    return CustomScaffoldLoading(
      isLoading: isLoading.value,
      child: Scaffold(
        appBar: AppBar(title: Text("settings".tr())),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(profileNotifierProvider);
            return await ref.read(profileNotifierProvider.future);
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              10.vertical,
              profileNotifier.when(
                data: (data) {
                  return Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CupertinoColors.systemGroupedBackground,
                        ),
                        child: Icon(Icons.person_rounded, size: 40),
                      ),
                      8.horizontal,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.fullName ?? "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              data.phoneNumber ?? "",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (e, s) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: CustomErrorWidget(
                      error: e,
                      onTap: () {
                        ref.invalidate(profileNotifierProvider);
                      },
                      isLoading: profileNotifier.isLoading,
                    ),
                  );
                },
                loading: () {
                  return LoadingWidget();
                },
              ),
              40.vertical,

              SettingsButton(
                text: "language".tr(),
                onTap: () {
                  context.push(AppRoutes.language);
                },
              ),
              6.vertical,
              SettingsButton(
                text: "change_phone_number".tr(),
                onTap: () {
                  context.push(AppRoutes.changePhone);
                },
              ),
              6.vertical,
              // SettingsButton(text: "about_us".tr(), onTap: () {}),
              // 6.vertical,
              SettingsButton(
                text: "questions_suggestions".tr(),
                onTap: () {
                  FeedbackModal.show(context);
                },
              ),
              40.vertical,
              Center(
                child: Text(
                  "${"version".tr()}: ${AppInfo.version}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              10.vertical,
              CustomButton(
                bgColor: Colors.redAccent,
                text: "logout".tr(),
                onTap: () {
                  isLoading.value = true;
                  try {
                    ref.read(loginNotifierProvider.notifier).logout().then((e) {
                      context.go(AppRoutes.login);
                    });
                  } catch (e) {}
                  isLoading.value = false;
                },
              ),
              10.vertical,
              CustomOutlinedButton(
                borderColor: Colors.transparent,
                textColor: Colors.redAccent,
                text: "delete_account".tr(),
                onTap: () {
                  isLoading.value = true;
                  try {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text("delete_account".tr()),
                          message: Text("delete_account_confirm".tr()),
                          actions: [
                            CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              onPressed: () async {
                                Navigator.pop(context); // close popup
                                await ref
                                    .read(loginNotifierProvider.notifier)
                                    .deleteAccount();
                                if (context.mounted) {
                                  context.go(AppRoutes.login);
                                }
                              },
                              child: Text("delete_account".tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context); // just close
                              },
                              child: Text("cancel".tr()),
                            ),
                          ],
                        );
                      },
                    );
                  } catch (e) {
                    debugPrint("Error: $e");
                  }
                  isLoading.value = false;
                },
              ),
              10.vertical,
            ],
          ),
        ),
      ),
    );
  }
}
