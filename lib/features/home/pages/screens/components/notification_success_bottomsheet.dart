import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/models/notification/notification.dart';
import 'package:bozorlik/features/home/pages/screens/bloc/bottomsheet_notification/bottomsheet_notification_bloc.dart';
import 'package:bozorlik/utils/date_formatter.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/mask.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class NotificationSuccessBottomsheet extends StatefulWidget {
  const NotificationSuccessBottomsheet({super.key, this.data, this.isRead});

  final NotificationResponseDataItems? data;
  final bool? isRead;

  @override
  State<NotificationSuccessBottomsheet> createState() =>
      _NotificationSuccessBottomsheetState();
}

class _NotificationSuccessBottomsheetState
    extends State<NotificationSuccessBottomsheet> {
  final bloc = BottomsheetNotificationBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<
        BottomsheetNotificationBloc,
        BottomsheetNotificationState
      >(
        listener: (context, state) {
          if (state.status == Status.error) {
            showCustomToast(
              title: state.errorMessage ?? "",
              type: ToastificationType.error,
            );
          }
          if (state.status == Status.success) {
            context.pop(true);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                6.vertical,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 4,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                12.vertical,
                Text(
                  formatDate2(widget.data?.createdAt ?? ""),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                12.vertical,
                Text(
                  "${formatPhoneNumber(widget.data?.receiver?.phoneNumber ?? "")} (${(widget.data?.receiver?.fullName ?? "")})",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "customer".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                12.vertical,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.data?.messageUz ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                48.vertical,
                widget.isRead == true?SizedBox():
                CustomButton(
                  textColor: AppColors.black,
                  bgColor: AppColors.grey,
                  isLoading: state.status == Status.loading,
                  text: "re_view".tr(),
                  onTap: () {
                    if (widget.isRead == true) {
                      context.pop(true);
                    } else {
                      bloc.add(OneReadEvent(id: widget.data?.id ?? ""));
                    }
                  },
                ),
                12.vertical,
               ( widget.data?.id==null||widget.isRead==true)?SizedBox():
                Builder(
                  builder: (context) {
                    return state.status==Status.loading?LoadingWidget():Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            bgColor: AppColors.red,
                            isLoading: state.status == Status.loading,
                            text: "rejection".tr(),
                            onTap: () {
                              if (widget.isRead == true) {
                                context.pop(true);
                              } else {
                                bloc.add(
                                  RejectAcceptEvent(
                                    marketId: widget.data?.market?.id ?? "",
                                    accept: false,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        12.horizontal,
                        Expanded(
                          child: CustomButton(
                            isLoading: state.status == Status.loading,
                            text: "acceptance".tr(),
                            onTap: () {
                              // if (widget.isRead == true) {
                              //   context.pop(true);
                              // } else {
                                bloc.add(
                                  RejectAcceptEvent(
                                    marketId: widget.data?.market?.id ?? "",
                                    accept: true,
                                  ),
                                );
                              // }
                            },
                          ),
                        ),
                      ],
                    );
                  }
                ),
                40.vertical,
              ],
            ),
          );
        },
      ),
    );
  }
}
