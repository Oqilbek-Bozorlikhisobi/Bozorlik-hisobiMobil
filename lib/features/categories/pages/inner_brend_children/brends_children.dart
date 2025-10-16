import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/categories/models/brends_response.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';
import 'package:bozorlik/features/categories/widgets/cart_create_modal.dart';
import 'package:bozorlik/features/home/widgets/create_market_bottomsheet.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/widgets/product_add_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BrendsChildrenScreen extends StatefulWidget {
  const BrendsChildrenScreen({super.key, required this.children, required this.title});

  final List<BrendsResponseDataItemsChildren> children;
  final String title;

  @override
  State<BrendsChildrenScreen> createState() => _BrendsChildrenScreenState();
}

class _BrendsChildrenScreenState extends State<BrendsChildrenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backGround,
        title: Text(widget.title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:
                  (widget.children.isEmpty)
                      ? Center(child: SvgPicture.asset(AppIcons.emptyMarket ?? ""))
                      : GridView.builder(
                        itemCount: widget.children.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              // showCupertinoModalBottomSheet(context: context, builder: (context)=>CreateMarketBottomsheet());

                              final result = await ProductAddModal.show(
                                context,
                                model: ProductModel(
                                  titleUz: widget.children[index].titleUz,
                                  titleEn: widget.children[index].titleEn,
                                  titleRu: widget.children[index].titleRu,
                                  image: widget.children[index].image,
                                  id: widget.children[index].id,
                                  category: ProductModel(
                                    titleUz: widget.children[index].parent?.titleUz,
                                    titleEn: widget.children[index].parent?.titleEn,
                                    titleRu: widget.children[index].parent?.titleRu,
                                    image: widget.children[index].parent?.image,
                                    id: widget.children[index].parent?.id,
                                  ),
                                ),
                              );
                              // if (result != null && result is bool && result == true) {
                              //   final model =CategoryModel();
                              //
                              //   context.push(AppRoutes.products, extra: model);
                              // }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.backGround),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                                        child: Image.network(
                                          widget.children[index].image ?? "https://backend.marketveb.uz/files/logo.png",
                                          width: 84,
                                          height: 64,
                                        ),
                                      ),
                                    ),
                                  ),
                                  8.vertical,

                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                widget.children[index].titleUz ?? "",
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            "1",
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
                                        ),
                                        8.vertical,
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                            child: Center(
                                              child: Text(
                                                "add".tr(),
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.53,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
