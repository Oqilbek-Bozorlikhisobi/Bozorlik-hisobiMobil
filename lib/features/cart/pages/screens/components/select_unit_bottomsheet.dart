import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SelectUnitBottomsheet extends StatefulWidget {
  const SelectUnitBottomsheet({super.key, required this.id});

  final String? id;

  @override
  State<SelectUnitBottomsheet> createState() => _SelectUnitBottomsheetState();
}

class _SelectUnitBottomsheetState extends State<SelectUnitBottomsheet> {
  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetUnitEvent());
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
                    child: Text("select_unit".tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ), 16.vertical,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("unit_description".tr(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                  16.vertical,
                  Expanded(
                    child:
                    state.statusUnits == Status.loading
                        ? LoadingWidget()
                        : state.statusUnits == Status.success
                        ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.units?.length,
                      itemBuilder: (context, index) {
                        final isSelected = widget.id == (state.units?[index].id??0);
                        return InkWell(
                          onTap: () {
                            var x=state.units?[index];
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
                                  state.units?[index].nameUz ?? "",
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
//       return SelectUnitBottomsheet(name: name);
//     },
//   );
// }
