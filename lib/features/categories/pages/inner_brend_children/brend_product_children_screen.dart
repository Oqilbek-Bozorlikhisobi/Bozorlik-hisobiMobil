import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/categories/models/brends_response.dart' show BrendsResponseDataItemsChildren, BrendsResponseDataItemsProducts;
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/widgets/product_add_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BrendProductChildrenScreen extends StatefulWidget {
  const BrendProductChildrenScreen({super.key, required this.products, required this.title, this.isCart});

  final List<BrendsResponseDataItemsProducts> products;
  final String title;
  final bool? isCart;
  @override
  State<BrendProductChildrenScreen> createState() => _BrendProductChildrenScreenState();
}

class _BrendProductChildrenScreenState extends State<BrendProductChildrenScreen> {
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
              (widget.products.isEmpty)
                  ? Center(child: SvgPicture.asset(AppIcons.emptyMarket ?? ""))
                  : GridView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // showCupertinoModalBottomSheet(context: context, builder: (context)=>CreateMarketBottomsheet());

                      if(widget.isCart==true){
                          context.pop(widget.products[index]);

                      }else{

                      final result = await ProductAddModal.show(
                        context,
                        model: ProductModel(
                          titleUz: widget.products[index].titleUz,
                          titleEn: widget.products[index].titleEn,
                          titleRu: widget.products[index].titleRu,
                          image: widget.products[index].images,
                          id: widget.products[index].id,
                          category: ProductModel(
                            titleUz: widget.products[index].titleUz,
                            titleEn: widget.products[index].titleEn,
                            titleRu: widget.products[index].titleRu,
                            image: widget.products[index].images,
                            id: widget.products[index].id,
                          ),
                        ),
                      );
                      }

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
                                  widget.products[index].images ?? "https://backend.marketveb.uz/files/logo.png",
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
                                        widget.products[index].titleUz ?? "",
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
