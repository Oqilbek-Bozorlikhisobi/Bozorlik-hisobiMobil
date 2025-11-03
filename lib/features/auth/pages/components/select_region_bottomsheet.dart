import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../app/theme.dart';

void showRegionBottomSheet(BuildContext context, registerNotifier, registerState) {
  const regionsUz = [
    "Toshkent V",
    "Toshkent Sh",
    "Samarqand",
    "Buxoro",
    "Andijon",
    "Namangan",
    "Farg'ona",
    "Xorazm",
    "Navoiy",
    "Surxondaryo",
    "Qashqadaryo",
    "Sirdaryo",
    "Jizzax",
    "Qoraqalpog'iston",
  ];
  const regionsRu = [
    "Ташкентская область",
    "Город Ташкент",
    "Самаркандская область",
    "Бухарская область",
    "Андижанская область",
    "Наманганская область",
    "Ферганская область",
    "Хорезмская область",
    "Навоийская область",
    "Сурхандарьинская область",
    "Кашкадарьинская область",
    "Сырдарьинская область",
    "Джизакская область",
    "Республика Каракалпакстан",
  ];
  const regionsEn = [
    "Tashkent Region",
    "Tashkent City",
    "Samarkand Region",
    "Bukhara Region",
    "Andijan Region",
    "Namangan Region",
    "Fergana Region",
    "Khorezm Region",
    "Navoi Region",
    "Surkhandarya Region",
    "Kashkadarya Region",
    "Sirdarya Region",
    "Jizzakh Region",
    "Republic of Karakalpakstan",
  ];
  const regionsCy = [
    "Тошкент вилоят",
    "Тошкент шаҳар",
    "Самарқанд",
    "Бухоро",
    "Андижон",
    "Наманган",
    "Фарғона",
    "Хоразм",
    "Навоий",
    "Сурхондарё",
    "Қашқадарё",
    "Сирдарё",
    "Жиззах",
    "Қорақалпоғистон",
  ];

  showCupertinoModalBottomSheet(
    context: context,
    // isScrollControlled: true,
    // backgroundColor: Colors.transparent,
    builder: (context) {
      return Material(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.vertical,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              16.vertical,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "select_region1".tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              16.vertical,
              Expanded(
                child: Builder(
                  builder: (context) {
                    final currentLocale = context.locale.languageCode;
                    List<String> getTitle() {
                      switch (currentLocale) {
                        case 'uz':
                          return regionsUz ?? [];
                        case 'ky':
                          return regionsCy??[];
                        case 'ru':
                          return regionsRu;
                        case 'en':
                          return regionsEn;
                        default:
                          return regionsUz;
                      }
                    }
                    var regions=getTitle();
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: regions.length,
                      itemBuilder: (context, index) {
                        final isSelected = registerState.region == regions[index];
                        return InkWell(
                          onTap: () {
                            registerNotifier.changeRegion(regions[index]);
                            Navigator.pop(context);
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
                                  regions[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected ? AppColors.primaryColor : Colors.black87,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
