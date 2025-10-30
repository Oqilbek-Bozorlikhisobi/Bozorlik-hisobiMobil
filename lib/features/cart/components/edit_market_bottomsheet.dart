import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/features/home/models/department_response.dart';
import 'package:bozorlik/features/home/models/marketability.dart';
import 'package:bozorlik/features/home/widgets/select_market_department_bottomsheet.dart';
import 'package:bozorlik/features/products/widgets/select_market_bottomsheet.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toastification/toastification.dart';

class EditMarketBottomsheet extends StatefulWidget {
  const EditMarketBottomsheet({super.key, required this.name, required this.id});

  final String name;
  final String id;

  @override
  State<EditMarketBottomsheet> createState() => _EditMarketBottomsheetState();
}

class _EditMarketBottomsheetState extends State<EditMarketBottomsheet> {
  final nameController = TextEditingController();
  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            showCustomToast(title: state.errorMessage ?? "", type: ToastificationType.error);
          }
          if (state.status == Status.success) {
            showCustomToast(title: "showCustomToast".tr(), type: ToastificationType.success);
            context.pop();
            context.pop(true);
          }
        },
        builder: (context, state) {
          return Material(
            child: Container(
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 36,
                        decoration: BoxDecoration(
                          color: context.isDarkMode ? AppColors.textPrimary : AppColors.grey,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                    ],
                  ),
                  12.vertical,
                  Text(
                    "edit_name".tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  ),
                  12.vertical,
                  // Text("name_shopping_list".tr(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  // 30.vertical,
                  CustomTextField(
                    isDeletable: true,
                    labelText: "shopping_name".tr(),
                    controller: nameController,
                    hintText: "shopping_list_example".tr(),
                  ),

                  20.vertical,
                  CustomButton(
                    isLoading: state.status == Status.loading,
                    text: "save".tr(),
                    onTap: () async {
                      if (nameController.text.isNotEmpty) {
                        bloc.add(EditMarketEvent(name: nameController.text, id: widget.id));
                      } else {
                        showCustomToast(title: "required".tr(), type: ToastificationType.warning);
                      }
                    },
                  ),
                  30.vertical,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
