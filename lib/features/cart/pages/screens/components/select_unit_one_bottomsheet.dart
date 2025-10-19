import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectUnitOneBottomsheet extends StatefulWidget {
  const SelectUnitOneBottomsheet({super.key, required this.unitId, this.unitName});

  final String? unitId;
  final String? unitName;

  @override
  State<SelectUnitOneBottomsheet> createState() => _SelectUnitOneBottomsheetState();
}

class _SelectUnitOneBottomsheetState extends State<SelectUnitOneBottomsheet> {
  final listUnits = [];

  @override
  void initState() {
    super.initState();
    if (widget.unitName != null&&(widget.unitName?.isNotEmpty??false)){
    listUnits.add(Unit(id: widget.unitId, name: widget.unitName));
    }
    listUnits.add(Unit(id: "-1", name: "total".tr()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
              children: [Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)))],
            ),
            16.vertical,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("select_unit".tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            16.vertical,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("unit_description".tr(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            ),
            16.vertical,
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: listUnits.length,
                itemBuilder: (context, index) {
                  final isSelected = widget.unitId == (listUnits[index].id ?? 0);
                  return InkWell(
                    onTap: () {
                      var x = listUnits[index];
                      context.pop(x);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 2, color: isSelected ? AppColors.primaryColor : CupertinoColors.systemGroupedBackground),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            listUnits[index].name ?? "",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
