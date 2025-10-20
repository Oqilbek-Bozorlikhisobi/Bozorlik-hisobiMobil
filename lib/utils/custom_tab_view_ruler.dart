import 'package:bozorlik/app/theme.dart';
import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  final TabController? controller;
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  // final IndexedWidgetBuilder pageBuilder;
  final ValueChanged<int>? onPositionChange;
  final ValueChanged<double>? onScroll;
  final int? initPosition;
  final EdgeInsetsGeometry? padding;
  final ValueNotifier<int>? currentIndexNotifier;
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;

  const CustomTabView({
    super.key,
    this.controller,
    required this.itemCount,
    required this.tabBuilder,
    // required this.pageBuilder,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
    this.padding,
    this.currentIndexNotifier, required this.widget1, required this.widget2, required this.widget3,
  });

  @override
  State<CustomTabView> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView> with AutomaticKeepAliveClientMixin {
  late int _currentCount;
  late int _currentPosition;

  void _handleIndexChange() {
    final index = widget.currentIndexNotifier?.value;
    if ((index ?? 0) >= 0 && (index ?? 0) < widget.itemCount) {
      widget.controller?.animateTo(index ?? 0);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.initPosition ?? 0;
    widget.controller!.addListener(onPositionChange);
    widget.controller!.animation?.addListener(onScroll);

    widget.currentIndexNotifier?.addListener(_handleIndexChange);
    _currentCount = widget.itemCount;
  }

  void onPositionChange() {
    if (widget.controller != null && !widget.controller!.indexIsChanging) {
      setState(() {
        _currentPosition = widget.controller!.index;
      });
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange!(_currentPosition);
      }
    }
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      widget.controller?.removeListener(onPositionChange);
      widget.controller?.animation?.removeListener(onScroll);
      widget.controller?.dispose();
      super.didUpdateWidget(oldWidget);

      if (widget.controller == null) {
        widget.controller!.addListener(onPositionChange);
        widget.controller!.animation?.addListener(onScroll);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          if (widget.initPosition != null) {
            widget.controller?.animateTo(widget.initPosition!);
          }
        }
      });

      _currentCount = widget.itemCount;
    } else if (widget.initPosition != null) {
      widget.controller?.animateTo(widget.initPosition!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
    widget.controller?.animation?.removeListener(onScroll);
    widget.controller?.removeListener(onPositionChange);
    widget.currentIndexNotifier?.removeListener(_handleIndexChange);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          tabAlignment: TabAlignment.center,
          physics: const BouncingScrollPhysics(),
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          dividerColor: AppColors.backGround,
          indicator: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
          splashBorderRadius: BorderRadius.circular(8),
          controller: widget.controller,
          tabs: List.generate(
            widget.itemCount,
                (index) {
              return widget.tabBuilder(context, index);
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: widget.controller,
            children:
            [
              widget.widget1,
              widget.widget2,
              widget.widget3,
            ]
            // List.generate(
            //   widget.itemCount,
            //       (index) => Container(key: ValueKey(index), child: widget.pageBuilder(context, index)),
            // ),
          ),
        ),
      ],
    );
  }

  void onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll!(widget.controller!.animation!.value);
    }
  }
}
