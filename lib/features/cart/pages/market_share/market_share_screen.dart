import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/pages/market_share/bloc/market_share_bloc.dart';
import 'package:bozorlik/features/cart/widgets/cart_share_modal.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../utils/enums.dart';

class MarketShareScreen extends StatefulWidget {
  const MarketShareScreen({super.key, required this.shopping});

  final CartResponseData? shopping;

  @override
  State<MarketShareScreen> createState() => _MarketShareScreenState();
}

class _MarketShareScreenState extends State<MarketShareScreen> {
  final bloc = MarketShareBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetMarketShareEvent(id: widget.shopping?.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<MarketShareBloc, MarketShareState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            showCustomToast(title: state.errorMessage ?? '', type: ToastificationType.error);
          }
          // if (state.statusDelete == Status.success) {
          //   bloc.add(GetMarketShareEvent(id: widget.shopping?.id ?? ""));
          // }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: "invitation_number".tr(),
                onTap: () {
                  CartShareModal.show(context, marketId: widget.shopping?.id ?? "").then((v) {
                    bloc.add(GetMarketShareEvent(id: widget.shopping?.id ?? ""));
                  });
                },
              ),
            ),
            backgroundColor: AppColors.backGround,
            appBar: AppBar(backgroundColor: AppColors.backGround, title: Text("\"${widget.shopping?.name}\" ${"share_market".tr()}")),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  state.status == Status.success
                      ? ListView(
                        children: [
                          Text(
                            "active_users".tr(),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          12.vertical,
                          Container(
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.users?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final user = state.users?[index];
                                  return Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(color: AppColors.backGround, borderRadius: BorderRadius.circular(12)),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Image.asset(user?.gender == "Male" ? AppImages.user1 : AppImages.user2),
                                              ),
                                            ),
                                            6.horizontal,
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user?.phoneNumber ?? '',
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                                ),
                                                Text(
                                                  user?.fullName ?? '',
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            if (ProfileRepository().id != user?.id)
                                              GestureDetector(
                                                onTap: () {
                                                  showCupertinoModalPopup(
                                                    context: context,
                                                    builder: (context) {
                                                      return CupertinoActionSheet(
                                                        actions: [
                                                          CupertinoActionSheetAction(
                                                            isDestructiveAction: true,
                                                            onPressed: () async {
                                                              bloc.add(DeleteUserEvent(userId: user?.id ?? "", marketId: widget.shopping?.id ?? ""));
                                                              context.pop();
                                                            },
                                                            child: Text("delete".tr()),
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

                                                },
                                                child: SvgPicture.asset(AppIcons.delete),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Divider(color: AppColors.grey),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          12.vertical,
                          if ((state.pendingUsers?.length != 0) && (state.pendingUsers?.length != null))
                            Text(
                              "active_users2".tr(),
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          12.vertical,
                          if ((state.pendingUsers?.length != 0) && (state.pendingUsers?.length != null))
                            Container(
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.pendingUsers?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final pendingUser = state.pendingUsers?[index];
                                    return Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(color: AppColors.backGround, borderRadius: BorderRadius.circular(12)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Image.asset(state.pendingUsers?[index].gender == "Male" ? AppImages.user1 : AppImages.user2),
                                                ),
                                              ),
                                              6.horizontal,
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pendingUser?.phoneNumber ?? '',
                                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                                  ),
                                                  Text(
                                                    pendingUser?.fullName ?? '',
                                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              if (ProfileRepository().id != pendingUser?.id)
                                                GestureDetector(
                                                  onTap: () {
                                                    showCupertinoModalPopup(
                                                      context: context,
                                                      builder: (context) {
                                                        return CupertinoActionSheet(
                                                          actions: [
                                                            CupertinoActionSheetAction(
                                                              isDestructiveAction: true,
                                                              onPressed: () async {
                                                                bloc.add(DeleteUserEvent(userId: pendingUser?.id ?? "", marketId: widget.shopping?.id ?? ""));
                                                                context.pop();

                                                              },
                                                              child: Text("delete".tr()),
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
                                                    // bloc.add(DeleteUserEvent(userId: pendingUser?.id ?? "", marketId: widget.shopping?.id ?? ""));
                                                  },
                                                  child: SvgPicture.asset(AppIcons.delete),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Divider(color: AppColors.grey),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          SizedBox(height: 80),
                        ],
                      )
                      : state.status == Status.empty
                      ? Center(child: SvgPicture.asset(AppIcons.empty))
                      : state.status == Status.error
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.errorMessage ?? ""),
                            12.vertical,
                            CustomButton(
                              text: "error".tr(),
                              onTap: () {
                                bloc.add(GetMarketShareEvent(id: widget.shopping?.id ?? ""));
                              },
                            ),
                          ],
                        ),
                      ):(state.statusDelete==Status.loading||state.status==Status.loading)?LoadingWidget()
                      : SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
