import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/pages/market_share/bloc/market_share_bloc.dart';
import 'package:bozorlik/features/cart/widgets/cart_share_modal.dart';
import 'package:bozorlik/features/history/models/get_all_history_response.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../utils/enums.dart';

class MarketShareScreenHistory extends StatefulWidget {
  const MarketShareScreenHistory({super.key, required this.shopping});

  final HistoryResponseDataData? shopping;

  @override
  State<MarketShareScreenHistory> createState() => _MarketShareScreenHistoryState();
}

class _MarketShareScreenHistoryState extends State<MarketShareScreenHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(backgroundColor: AppColors.backGround, centerTitle: true, title: Text("${widget.shopping?.name}")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child:
            (widget.shopping?.users?.isNotEmpty ?? false)
                ? ListView(
                  children: [
                    Text("active_users".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18)),
                    12.vertical,
                    Container(
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.shopping?.users?.length ?? 0,
                          itemBuilder: (context, index) {
                            final user = widget.shopping?.users?[index];
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
                  ],
                )
                : (widget.shopping?.users?.isEmpty ?? false)
                ? Center(child: SvgPicture.asset(AppIcons.empty))
                : SizedBox(),
      ),
    );
  }
}
