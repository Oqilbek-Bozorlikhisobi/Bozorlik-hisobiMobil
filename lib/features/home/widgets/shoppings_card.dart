import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Shoppings extends StatefulWidget {
  const Shoppings({super.key});

  @override
  State<Shoppings> createState() => _ShoppingsState();
}

class _ShoppingsState extends State<Shoppings> {
  final List<ShoppingsItem> shoppings = [
    ShoppingsItem(title: "Oilam", tag: "#bozorlik14", members: 7, price: 147000, date: "10.01.2024", color: AppColors.primaryColor),
    ShoppingsItem(title: "Do'stlar", tag: "#bozorlik15", members: 5, price: 230000, date: "15.02.2024",color: AppColors.red600),
    ShoppingsItem(title: "Ish", tag: "#bozorlik16", members: 12, price: 520000, date: "20.03.2024",color: AppColors.greyText),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("shoppings".tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black)),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey.withOpacity(0.2)),
                  child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.black, size: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              itemCount: shoppings.length,
              itemBuilder: (context, index) {
                final shopping = shoppings[index];
                return Container(
                  width: 360,
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.backGround,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grey.withValues(alpha: 0.2), width: 1),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.star, width: 56, height: 56,colorFilter:
                              ColorFilter.mode(shopping.color, BlendMode.srcIn),),
                            Text(
                              shopping.title.substring(0, 1).toUpperCase(),
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${shopping.title}: ",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black),
                                ),
                                Text(
                                  shopping.tag,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                // Members
                                SvgPicture.asset(AppIcons.receipt, height: 18, width: 18),
                                SizedBox(width: 4),
                                Text(
                                  "${shopping.members}",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1), fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                Text("|"),
                                SizedBox(width: 8),
                                SvgPicture.asset(AppIcons.wallet, height: 18, width: 18),
                                SizedBox(width: 4),
                                Text(
                                  NumberFormat('#,###', 'en_US').format(shopping.price).replaceAll(',', ' '),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1), fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                Text("|"),
                                SizedBox(width: 8),
                                SvgPicture.asset(AppIcons.calendar, height: 18, width: 18),
                                // Date
                                // Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.grey),
                                SizedBox(width: 4),
                                Text(
                                  shopping.date,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1), fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingsItem {
  final String title;
  final String tag;
  final int members;
  final int price;
  final String date;
  final Color color;

  ShoppingsItem( {required this.color,required this.title, required this.tag, required this.members, required this.price, required this.date});
}
