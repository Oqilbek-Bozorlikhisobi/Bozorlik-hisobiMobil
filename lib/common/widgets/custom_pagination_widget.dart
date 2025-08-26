import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../app/theme.dart';
import '../models/pagination_model.dart';

import '../values/app_assets.dart';
import 'custom_error_widget.dart';
import 'loading_widget.dart';

class DataItem<T> {
  final T? data;
  final bool isCustom;

  DataItem(this.data, {this.isCustom = false});
}

class CustomPaginationWidget<T> extends StatefulHookConsumerWidget {
  const CustomPaginationWidget({
    super.key,
    required this.itemBuilder,
    required this.getItems,
    this.padding,
    this.refreshers,
    this.isListView = true,
    this.aspectRatio = 1,
    this.spacing = 10,
    this.onInit,
    this.shrinkWrap = false,
    this.emptyIcon,
    this.reverse = false,
    this.physics,
    this.customWidget,
  });

  final Widget Function(T model) itemBuilder;
  final Future<PaginationModel<T>> Function(int page) getItems;
  final EdgeInsets? padding;
  final List<ValueNotifier<dynamic>>? refreshers;
  final bool isListView;
  final double spacing;
  final double aspectRatio;
  final bool shrinkWrap;
  final String? emptyIcon;
  final bool reverse;
  final ScrollPhysics? physics;
  final Widget? customWidget;

  final Function(PagingController<int, DataItem<T>> pagingController)? onInit;

  @override
  ConsumerState<CustomPaginationWidget> createState() =>
      _CustomPaginationWidgetState<T>();
}

class _CustomPaginationWidgetState<T>
    extends ConsumerState<CustomPaginationWidget<T>>
    with AutomaticKeepAliveClientMixin {
  late final PagingController<int, DataItem<T>> _pagingController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, DataItem<T>>(firstPageKey: 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInit?.call(_pagingController);
    });

    if (widget.refreshers != null) {
      for (var element in widget.refreshers!) {
        element.addListener(() {
          Future.delayed(Duration(milliseconds: 100)).then((_) {
            _pagingController.refresh();
          });
        });
      }
    }

    _pagingController.addPageRequestListener((pageKey) async {
      try {
        final items = await widget.getItems(pageKey);
        final hasMore = items.page != items.pages;

        final List<DataItem<T>> list =
            (items.items ?? []).map((e) => DataItem<T>(e)).toList();

        if (pageKey == 1 && widget.customWidget != null) {
          list.insert(0, DataItem(null, isCustom: true));
        }

        if (hasMore) {
          _pagingController.appendPage(list, pageKey + 1);
        } else {
          _pagingController.appendLastPage(list);
        }
      } catch (e) {
        debugPrint(e.toString());

        _pagingController.error = e;
        rethrow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final content =
        widget.isListView
            ? PagedListView<int, DataItem<T>>(
              reverse: widget.reverse,
              shrinkWrap: widget.shrinkWrap,
              padding: widget.padding,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageErrorIndicatorBuilder:
                    (context) => SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: CustomErrorWidget(
                        isLoading: false,
                        onTap: () {
                          _pagingController.refresh();
                        },
                        error: _pagingController.error,
                      ),
                    ),
                itemBuilder: (context, item, index) {
                  if (item.isCustom) {
                    return widget.customWidget!;
                  } else {
                    return widget.itemBuilder(item.data as T);
                  }
                  return const SizedBox.shrink();
                },
                firstPageProgressIndicatorBuilder:
                    (context) => const LoadingWidget(),
                newPageProgressIndicatorBuilder:
                    (context) =>
                        const LoadingWidget().marginSymmetric(vertical: 10),
                noItemsFoundIndicatorBuilder:
                    (_) => Center(
                      child: SvgPicture.asset(
                        widget.emptyIcon ?? AppIcons.empty,
                      ),
                    ),
                newPageErrorIndicatorBuilder:
                    (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "something_went_wrong".tr(),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {
                            _pagingController.retryLastFailedRequest();
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
              ),
            )
            : PagedGridView<int, DataItem<T>>(
              reverse: widget.reverse,
              shrinkWrap: widget.shrinkWrap,
              padding: widget.padding,
              pagingController: _pagingController,
              physics: widget.physics,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.8,
              ),
              builderDelegate: PagedChildBuilderDelegate(
                newPageProgressIndicatorBuilder:
                    (context) =>
                        const LoadingWidget().marginSymmetric(vertical: 10),
                itemBuilder: (context, item, index) {
                  if (item.isCustom) {
                    return widget.customWidget!;
                  } else {
                    return widget.itemBuilder(item.data as T);
                  }
                },
                firstPageProgressIndicatorBuilder:
                    (context) => const LoadingWidget(),
                noItemsFoundIndicatorBuilder:
                    (_) =>
                        Center(child: SvgPicture.asset(widget.emptyIcon ?? "")),
                newPageErrorIndicatorBuilder:
                    (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Something went wrong",
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {
                            _pagingController.retryLastFailedRequest();
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                firstPageErrorIndicatorBuilder:
                    (context) => SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,

                      child: CustomErrorWidget(
                        isLoading: false,
                        onTap: () {
                          _pagingController.refresh();
                        },
                        error: _pagingController.error,
                      ),
                    ),
              ),
            );

    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        _pagingController.refresh();
      },
      child: content,
    );
  }
}

class CustomNoInternetWidget {}
