import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepartmentCard extends StatefulWidget {
  const DepartmentCard({super.key});

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  final List<DepartmentItem> departments = [
    DepartmentItem(title: "Oila", image: AppIcons.familyDepartment),
    DepartmentItem(title: "Restoran", image: AppIcons.familyDepartment),
    DepartmentItem(title: "To'yxona", image: AppIcons.familyDepartment),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("department".tr(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black)),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey.withOpacity(0.2)),
                  child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.black, size: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 178,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: departments.length,
              itemBuilder: (context, index) {
                final department = departments[index];
                return Container(
                  width: 280,
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backGround,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: Offset(0, 2))],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          department.image,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Colors.teal.shade100,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
                              ),
                            );
                          },
                        ),
                      ),
                      // Title
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(department.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black)),
                      ),
                      // Logo
                      Positioned(bottom: 16, left: 16, child: SvgPicture.asset(AppIcons.logo)),
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

class DepartmentItem {
  final String title;
  final String image;

  DepartmentItem({required this.title, required this.image});
}
