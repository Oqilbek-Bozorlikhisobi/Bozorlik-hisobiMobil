import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/values/app_infos.dart';
import 'package:bozorlik/common/widgets/custom_error_widget.dart';
import 'package:bozorlik/common/widgets/custom_scaffold_loading.dart';
import 'package:bozorlik/features/settings/widgets/coming_soon_dialog.dart';
import 'package:bozorlik/features/settings/widgets/feedback_modal.dart';
import 'package:bozorlik/utils/mask.dart';
import 'package:bozorlik/utils/theme/theme_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../../../common/widgets/loading_widget.dart';
import '../../auth/notifiers/login_notifier.dart';
import '../notifiers/profile_notifier.dart';
import '../widgets/profile_item.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileNotifier = ref.watch(profileNotifierProvider);
    final isLoading = useState(false);
    return CustomScaffoldLoading(
      isLoading: isLoading.value,
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        appBar: AppBar(backgroundColor: AppColors.backGround, title: Text("settings".tr())),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(profileNotifierProvider);
            return await ref.read(profileNotifierProvider.future);
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              10.vertical,
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: profileNotifier.when(
                    data: (data) {
                      return Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white, border: Border.all(color: AppColors.greyText)),
                            child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(AppIcons.logo)),
                          ),
                          8.horizontal,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.fullName ?? "", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                Text(
                                  maskFormatterPhone.maskText(data.phoneNumber ?? "") ?? "",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                ),
              ),
              24.vertical,
              Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Column(
                    children: [
                      ProfileItem(
                        svg: AppIcons.edit,
                        title: 'edit_profile'.tr(),
                        onTap: () {
                          showComingSoon(context: context);
                        },
                      ),
                      Divider(thickness: 0.5, color: AppColors.greyText.withValues(alpha: 0.5)),
                      ProfileItem(
                        svg: AppIcons.editPassword,
                        title: 'edit_password'.tr(),
                        onTap: () {
                          showComingSoon(context: context);
                        },
                      ),
                      Divider(thickness: 0.5, color: AppColors.greyText.withValues(alpha: 0.5)),
                      ProfileItem(
                        svg: AppIcons.simcard,
                        title: 'edit_phone'.tr(),
                        onTap: () {
                          context.push(AppRoutes.changePhone);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              6.vertical,
              Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Column(
                    children: [
                      ProfileItem(
                        svg: AppIcons.language,
                        title: 'language'.tr(),
                        onTap: () {
                          context.push(AppRoutes.language);
                        },
                      ),
                      Divider(thickness: 0.5, color: AppColors.greyText.withValues(alpha: 0.5)),
                      ProfileItem(
                        svg: AppIcons.design,
                        title: 'design'.tr(),
                        onTap: () {
                          context.read<ThemeBloc>().add(ToggleThemeEvent());

                          // showComingSoon(context: context);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              6.vertical,
              Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Column(
                    children: [
                      ProfileItem(
                        svg: AppIcons.appRating,
                        title: 'app_rating'.tr(),
                        onTap: () {
                          showComingSoon(context: context);
                        },
                      ),
                      Divider(thickness: 0.5, color: AppColors.greyText.withValues(alpha: 0.5)),
                      ProfileItem(
                        svg: AppIcons.appeal,
                        title: 'appeal'.tr(),
                        onTap: () {
                          FeedbackModal.show(context);
                        },
                      ),
                      Divider(thickness: 0.5, color: AppColors.greyText.withValues(alpha: 0.5)),
                      ProfileItem(svg: AppIcons.info, title: 'info_app'.tr(), onTap: () {}, title2: "ver ${AppInfo.version}"),
                    ],
                  ),
                ),
              ),
              6.vertical,
              Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Column(
                    children: [
                      ProfileItem(
                        svg: AppIcons.exitApp,
                        title: 'exit_app'.tr(),
                        onTap: () {
                          isLoading.value = true;
                          try {
                            ref.read(loginNotifierProvider.notifier).logout().then((e) {
                              context.go(AppRoutes.login);
                            });
                          } catch (e) {}
                          isLoading.value = false;
                        },
                        title2: "",
                      ),
                      Divider(thickness: 0.5, color: AppColors.greyText.withValues(alpha: 0.5)),
                      ProfileItem(
                        title2: "",
                        svg: AppIcons.delete,
                        title: 'delete_profile'.tr(),
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
                                        await ref.read(loginNotifierProvider.notifier).deleteAccount();
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
                    ],
                  ),
                ),
              ),

              20.vertical,
            ],
          ),
        ),
      ),
    );
  }
}
