import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/features/categories/models/brends_response.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/widgets/product_add_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'brend_product_children_screen.dart';

class BrendsChildrenScreen extends StatefulWidget {
  const BrendsChildrenScreen({super.key, required this.children, required this.title, required this.products});

  final List<BrendsResponseDataItemsChildren> children;
  final List<BrendsResponseDataItemsProducts> products;
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
        child:
            (widget.children.isEmpty && widget.products.isEmpty)
                ? Center(child: SvgPicture.asset(AppIcons.emptyMarket ?? ""))
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Children GridView
                      if (widget.children.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "categories".tr(),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.children.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder:
                                        (context) => BrendProductChildrenScreen(products: widget.children[index].products ?? [], title: widget.title),
                                  ),
                                );
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
                                          Text("1", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor)),
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
                      ],

                      // Products GridView
                      if (widget.products.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            " ${widget.title} ${"products".tr()}",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
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
                                          Text("1", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor)),
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
                      ],
                    ],
                  ),
                ),
      ),
    );
  }
}
