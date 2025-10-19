import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/cart/pages/screens/bloc/end_market_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class EndMarketBottomsheet extends StatefulWidget {
  const EndMarketBottomsheet({super.key,required this.marketTypeId,required this.marketId});

  final String? marketTypeId;
  final String? marketId;

  @override
  State<EndMarketBottomsheet> createState() => _EndMarketBottomsheetState();
}

class _EndMarketBottomsheetState extends State<EndMarketBottomsheet> {
  final TextEditingController nameController = TextEditingController();
  final bloc = EndMarketBloc();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<EndMarketBloc, EndMarketState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              showCustomToast(title: state.errorMessage ?? '', type: ToastificationType.error);
            }

            if (state.status == Status.success) {
              context.pop(true);
              context.pop(true);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 4, width: 36, decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8))),
                      ],
                    ),
                  ),
                  Text("${"end_market".tr()}🎉", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
                  12.vertical,

                  CustomTextField(isDeletable: true, labelText: "make_market".tr(), controller: nameController, hintText: "make_market_hint".tr()),
                  16.vertical,
                  CustomButton(
                    isLoading: state.status==Status.loading,
                    text: "confirmation".tr(),
                    onTap: () {
                      bloc.add(
                        EndMarketButton(
                          marketId: widget.marketId ?? "",
                          location: nameController.text,
                          name: nameController.text,
                          marketTypeId: widget.marketTypeId ?? "",
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
