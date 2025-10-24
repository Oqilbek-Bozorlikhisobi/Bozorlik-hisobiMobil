import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/home/models/notification/notification.dart';
import 'package:bozorlik/utils/custom_tab_view_ruler.dart';
import 'package:bozorlik/utils/date_formatter.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/error_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/notification_bloc.dart';
import 'components/notification_info_bottomsheet.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with TickerProviderStateMixin {
  int selectedTab = 0;
  final bloc = NotificationBloc();
  late RefreshController refreshControllerCommon;
  late RefreshController refreshControllerValue;
  late RefreshController refreshControllerPosition;
  late TabController controllerTab;

  @override
  void initState() {
    super.initState();
    controllerTab = TabController(vsync: this, initialIndex: 0, animationDuration: const Duration(seconds: 0), length: 3);
    refreshControllerCommon = RefreshController(initialRefresh: false);
    refreshControllerValue = RefreshController(initialRefresh: false);
    refreshControllerPosition = RefreshController(initialRefresh: false);
    bloc.add(GetNotificationEvent());
  }

  final List<String> items = ["all".tr(), "un_read".tr(), "read".tr()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          // if (state.status != Status.loading) {
          //   refreshControllerCommon.refreshCompleted();
          //   refreshControllerValue.refreshCompleted();
          //   refreshControllerPosition.refreshCompleted();
          // }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGround,
            appBar: AppBar(
              backgroundColor: AppColors.backGround,
              elevation: 0,
              leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
              title: Text("notifications".tr(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap:
                      state.statusAll == Status.success
                          ? null
                          : () {
                            bloc.add(AllReadEvent());
                            bloc.add(GetNotificationEvent());
                            bloc.add(GetReadNotificationEvent());
                            bloc.add(GetUnReadNotificationEvent());
                          },
                  child: SvgPicture.asset(
                    AppIcons.checkNotification,
                    colorFilter: ColorFilter.mode(state.statusAll == Status.success ? AppColors.grey : AppColors.primaryColor, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            body: CustomTabView(
              controller: controllerTab,
              itemCount: items.length,
              onPositionChange: (index) {
                if (index == 0) {
                  bloc.add(GetNotificationEvent());
                } else if (index == 1) {
                  bloc.add(GetUnReadNotificationEvent());
                } else if (index == 2) {
                  bloc.add(GetReadNotificationEvent());
                }
              },
              tabBuilder: (context, index) {
                return Tab(text: items[index]);
              },
              widget1: SmartRefresher(
                controller: refreshControllerCommon,
                enablePullDown: true,
                enablePullUp: false,
                onLoading: () {
                  bloc.add(GetNextNotificationEvent());
                },
                onRefresh: () async {
                  bloc.add(GetNotificationEvent());
                  // context.read<RulesBloc>().add(GetRulersEvent(filter: 'common', ruleText: '', selectIndex: 1));
                },
                child: Builder(
                  builder: (context) {
                    if (state.status == Status.loading) return const Center(child: CircularProgressIndicator());
                    if (state.status == Status.error) return Center(child: ErrorView(error: state.errorMessage.toString()));
                    if (((state.itemsAll?.length ?? 0)) < 1) return Center(child: SvgPicture.asset(AppIcons.splashLogo, height: 200, width: 200));

                    if (state.status == Status.success) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: state.itemsAll?.length,
                          itemBuilder: (context, index) {
                            final notification = state.itemsAll?[index];
                            return GestureDetector(
                              onTap: () {
                                if (notification.isGlobal == true) {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotificationInfoBottomsheet(data: notification),
                                  ).then((v) {
                                    bloc.add(GetNotificationEvent());
                                  });
                                } else {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotificationInfoBottomsheet(data: notification),
                                  ).then((v) {
                                    bloc.add(GetNotificationEvent());
                                  });
                                }
                              },
                              child: _buildNotificationCard(notification!),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
              widget2: SmartRefresher(
                controller: refreshControllerValue,
                enablePullUp: false,
                enablePullDown: true,
                onLoading: () {
                  bloc.add(GetNextUnReadNotificationEvent());
                },
                onRefresh: () async {
                  bloc.add(GetUnReadNotificationEvent());
                },
                child: Builder(
                  builder: (context) {
                    if (state.status == Status.loading) return const Center(child: CircularProgressIndicator());
                    if (state.status == Status.error) return Center(child: ErrorView(error: state.errorMessage.toString()));
                    if (((state.itemsUnRead?.length ?? 0)) < 1) return Center(child: SvgPicture.asset(AppIcons.splashLogo, height: 200, width: 200));

                    if (state.status == Status.success) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: state.itemsUnRead?.length,
                          itemBuilder: (context, index) {
                            final notification = state.itemsUnRead?[index];
                            return GestureDetector(
                              onTap: () {
                                if (notification.isGlobal == true) {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotificationInfoBottomsheet(data: notification),
                                  ).then((v) {
                                    bloc.add(GetUnReadNotificationEvent());
                                  });
                                } else {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotificationInfoBottomsheet(data: notification),
                                  ).then((v) {
                                    bloc.add(GetUnReadNotificationEvent());
                                  });
                                }
                              },
                              child: _buildNotificationCard(notification!),
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              widget3: SmartRefresher(
                controller: refreshControllerPosition,
                enablePullUp: false,
                enablePullDown: true,
                onLoading: () {
                  bloc.add(GetNextReadNotificationEvent());
                },
                onRefresh: () async {
                  bloc.add(GetReadNotificationEvent());
                },
                child: Builder(
                  builder: (context) {
                    if (state.status == Status.loading) return const Center(child: CircularProgressIndicator());
                    if (state.status == Status.error) return Center(child: ErrorView(error: state.errorMessage.toString()));
                    if (((state.itemsRead?.length ?? 0)) < 1) {
                      return Center(child: SvgPicture.asset(AppIcons.splashLogo, height: 200, width: 200));
                    }
                    if (state.status == Status.success) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: state.itemsRead?.length,
                          itemBuilder: (context, index) {
                            final notification = state.itemsRead?[index];
                            return GestureDetector(
                              onTap: () {
                                if (notification.isGlobal == true) {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotificationInfoBottomsheet(data: notification),
                                  ).then((v) {
                                    // bloc.add(GetReadNotificationEvent());
                                  });
                                } else {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotificationInfoBottomsheet(data: notification),
                                  ).then((v) {
                                    // bloc.add(GetReadNotificationEvent());
                                  });
                                }
                              },
                              child: _buildNotificationCard(notification!),
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotificationCard(NotificationResponseDataItems notification) {
    final currentLocale = context.locale.languageCode;

    // Tilga qarab title-ni tanlash
    String getTitle() {
      switch (currentLocale) {
        case 'uz':
          return notification.titleUz ?? "";
        case 'ky':
          return notification.titleUzk ?? "";
        case 'ru':
          return notification.titleRu ?? "";
        case 'en':
          return notification.titleEn ?? "";
        default:
          return notification.titleUz ?? "";
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: (notification.isRead ?? false) ? AppColors.grey : AppColors.primaryColor,
          width: (notification.isRead ?? false) ? 1 : 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTitle() ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: (notification.isRead ?? false) ? FontWeight.w400 : FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(formatDate2(notification.createdAt ?? ""), style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
          if (!(notification.isRead ?? false))
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String date;
  final bool isRead;

  NotificationItem({required this.title, required this.date, required this.isRead});
}
