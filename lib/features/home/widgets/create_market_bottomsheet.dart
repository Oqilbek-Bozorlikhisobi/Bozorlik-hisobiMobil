import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toastification/toastification.dart';

class CreateMarketBottomsheet extends StatefulWidget {
  const CreateMarketBottomsheet({super.key});

  @override
  State<CreateMarketBottomsheet> createState() => _CreateMarketBottomsheetState();
}

class _CreateMarketBottomsheetState extends State<CreateMarketBottomsheet> {
  final nameController = TextEditingController();
  final bloc = HomeBloc();

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
            showCustomToast(title: state.errorMessage ?? "", type: ToastificationType.success);
            context.pop();
          }
        },
        builder: (context, state) {
          return Material(
            child: Container(
              decoration: BoxDecoration(color: CupertinoColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
              padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(decoration: BoxDecoration(color: AppColors.grey),)
                    ],
                  ),
                  Text("create_shopping_list".tr(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  4.vertical,
                  Text("name_shopping_list".tr(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  30.vertical,
                  CustomTextField(labelText: "shopping_list_name".tr(), controller: nameController, hintText: "shopping_list_example".tr()),

                  20.vertical,
                  CustomButton(
                    isLoading: state.status == Status.loading,
                    text: "create".tr(),
                    onTap: () async {
                      if (nameController.text.isNotEmpty) {
                        bloc.add(CreateMarketEvent(name: nameController.text));
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

Future showCreateMarketCart(BuildContext context) async {
  return showCupertinoModalBottomSheet(backgroundColor: Colors.transparent, context: context, builder: (context) => CreateMarketBottomsheet());
}
