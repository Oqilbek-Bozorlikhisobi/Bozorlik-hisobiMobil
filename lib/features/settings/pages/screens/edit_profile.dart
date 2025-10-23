import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../utils/enums.dart';
import 'bloc/edit_profile_bloc.dart';
import 'components/select_region_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectRegion;
  String? gender;
  final nameController = TextEditingController();
  final bloc = EditProfileBloc();

  @override
  void initState() {
    selectRegion = ProfileRepository().region;
    gender = ProfileRepository().gender;
    nameController.text = ProfileRepository().fullName;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            context.pop(true);
          }

          if (state.status == Status.error) {
            showCustomToast(title: state.errorMessage ?? "", type: ToastificationType.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                text: "save".tr(),
                onTap: () {
                  if (nameController.text.isEmpty || selectRegion == null) {
                    showCustomToast(title: "Required fields", type: ToastificationType.error);
                    return;
                  }

                  bloc.add(SaveEditEvent(fullName: nameController.text, region: selectRegion ?? "", gender: gender ?? ""));
                },
              ),
            ),
            backgroundColor: AppColors.backGround,
            appBar: AppBar(backgroundColor: AppColors.backGround, centerTitle: true, title: Text("edit_profile".tr())),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey)),
                              child: Padding(padding: EdgeInsets.all(16.0), child: Image.asset(AppImages.logo, height: 56, width: 56)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    24.vertical,
                    CustomTextField(
                      validatorText: "please_enter_fullname".tr(),
                      controller: nameController,
                      textInputType: TextInputType.text,
                      onChange: (value) {
                        // registerNotifier.changeFullName(value);
                      },
                      labelText: "enter_fullname".tr(),
                      hintText: "full_name".tr(),
                    ),
                    16.vertical,
                    Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Text("select_region".tr())),
                    5.vertical,

                    GestureDetector(
                      onTap:
                          () => showSelectRegionBottomSheet(context).then((v) {
                            if (v != null) {
                              selectRegion = v;
                              setState(() {});
                            }
                          }),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 2, color: CupertinoColors.systemGroupedBackground),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectRegion ?? "select_region".tr(), style: TextStyle(fontSize: 16, color: Colors.black87)),
                            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),

                    12.vertical,
                    Text("your_gender".tr(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
                    8.vertical,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              gender = "male".tr();
                              gender = "Male";
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 2,
                                  color: gender == "Male".tr() ? AppColors.primaryColor : CupertinoColors.systemGroupedBackground,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "male".tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: gender == "male".tr() ? AppColors.primaryColor : Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.horizontal,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              gender = "female".tr();
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 2,
                                  color: gender == "female".tr() ? AppColors.primaryColor : CupertinoColors.systemGroupedBackground,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "female".tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: gender == "female".tr() ? AppColors.primaryColor : Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // if (formFieldState.hasError)
                    //   Padding(
                    //     padding: EdgeInsets.only(left: 12, top: 4),
                    //     child: Text(formFieldState.errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
                    //   ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
