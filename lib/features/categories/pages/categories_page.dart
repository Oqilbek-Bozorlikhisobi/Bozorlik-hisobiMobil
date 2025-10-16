import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/categories/bloc/brends_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'inner_brend_children/brends_children.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final bloc = BrendsBloc();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    bloc.add(GetBrendsEvent());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<BrendsBloc, BrendsState>(
        listener: (context, state) {
          if (state.status != Status.loading) {
            _refreshController.refreshCompleted();
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGround,
            appBar: AppBar(
              backgroundColor: AppColors.backGround,
              title: Text('categories'.tr(), style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:
                        state.status == Status.loading
                            ? LoadingWidget()
                            : state.status == Status.empty
                            ? Center(child: SvgPicture.asset(AppIcons.emptyMarket ?? ""))
                            : state.status == Status.error
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.noInternet),
                                  10.vertical,
                                  CustomButton(
                                    text: state.errorMessage ?? "Xatolik",
                                    onTap: () {
                                      bloc.add(GetBrendsEvent());
                                    },
                                  ),
                                ],
                              ),
                            )
                            : state.status == Status.success
                            ? SmartRefresher(
                              controller: _refreshController,
                              enablePullUp: true,
                              enablePullDown: true,
                              header: MaterialClassicHeader(color: AppColors.primaryColor),
                              onRefresh: () {
                                bloc.add(GetBrendsEvent());
                              },
                              onLoading: () {
                                bloc.add(NextGetBrendsEvent());
                              },
                              child: GridView.builder(
                                itemCount: state.items?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>BrendsChildrenScreen(title: state.items?[index].titleUz??"",
                                      children: state.items?[index].children??[],)));
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
                                                  state.items?[index].image ?? "https://backend.marketveb.uz/files/logo.png",
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
                                                        state.items?[index].titleUz ?? "",
                                                        style: Theme.of(
                                                          context,
                                                        ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "products".tr(),
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
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
                                  childAspectRatio: 0.6,
                                ),
                              ),
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

// class CategoriesPage extends HookConsumerWidget {
//   const CategoriesPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: Text('categories'.tr())),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // CustomTextField(
//             //   focusNode: focusNode,
//             //   readOnly: true,
//             //   onTap: () {
//             //     focusNode.unfocus();
//             //     context.push(AppRoutes.search);
//             //   },
//             //   hintText: "search_products_categories".tr(),
//             //   prefixIcon: AppIcons.search,
//             // ),
//             // 12.vertical,
//             //
//             // Text(
//             //   "for_manufacturers_wholesalers".tr(),
//             //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//             // ),
//             // 6.vertical,
//             // Text(
//             //   "select_category_to_add".tr(),
//             //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//             // ),
//             12.vertical,
//             Expanded(
//               child: CustomPaginationWidget(
//                 itemBuilder: (item) {
//                   return CategoryWidget(model: item);
//                 },
//                 getItems: (page) async {
//                   return await ref.read(categoriesNotifierProvider(page: page).future);
//                 },
//                 isListView: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
