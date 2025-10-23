import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/banners_department_widget.dart';
import 'components/tab_department.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  final bloc = HomeBloc();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    bloc.add(GetBannerEvent());
    bloc.add(GetDepartmentEvent());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    bloc.close();
    super.dispose();
  }

  void _onRefresh() {
    bloc.add(GetBannerEvent());
    bloc.add(GetDepartmentEvent());
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // Agar kerak bo'lsa, state changes handle qilish
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGround,
            appBar: AppBar(
              backgroundColor: AppColors.backGround,
              centerTitle: true,
              title: Text("department".tr()),
            ),
            body: SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              enablePullDown: true,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: DepartmentBanner(bloc: bloc),
                    ),
                  ];
                },
                body: TabBarExample(),
              ),
            ),
          );
        },
      ),
    );
  }
}