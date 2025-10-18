import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../app/theme.dart';

class ShowMarketDepartmentBottomsheet extends StatefulWidget {
  const ShowMarketDepartmentBottomsheet({super.key, required this.id});

  final String? id;

  @override
  State<ShowMarketDepartmentBottomsheet> createState() => _ShowMarketDepartmentBottomsheetState();
}

class _ShowMarketDepartmentBottomsheetState extends State<ShowMarketDepartmentBottomsheet> {
  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetDepartmentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Material(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.vertical,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
                    ],
                  ),
                  16.vertical,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("select_market".tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  16.vertical,
                  Expanded(
                    child:
                        state.statusDepartment == Status.loading
                            ? LoadingWidget()
                            : state.statusDepartment == Status.success
                            ? ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.departmentData?.length,
                              itemBuilder: (context, index) {
                                final isSelected = widget.id == (state.departmentData?[index].id??0);
                                return InkWell(
                                  onTap: () {
                                    var x=state.departmentData?[index];
                                    // registerNotifier.changeRegion(regions[index]);
                                    // Navigator.pop(context);
                                    context.pop(x);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        width: 2,
                                        color: isSelected ? AppColors.primaryColor : CupertinoColors.systemGroupedBackground,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.departmentData?[index].titleUz ?? "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected ? AppColors.primaryColor : Colors.black87,
                                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                          ),
                                        ),
                                        if (isSelected) Icon(Icons.check_circle, color: AppColors.primaryColor, size: 24),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                            : SizedBox(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// void showMarketBottomSheet(BuildContext context, String name) {
//
//   showCupertinoModalBottomSheet(
//     context: context,
//     // isScrollControlled: true,
//     // backgroundColor: Colors.transparent,
//     builder: (context) {
//       return ShowMarketDepartmentBottomsheet(name: name);
//     },
//   );
// }
