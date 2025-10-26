import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/models/get_all_units_response.dart';
import 'package:bozorlik/features/home/models/banner_response.dart';
import 'package:bozorlik/features/home/models/department_response.dart';
import 'package:bozorlik/features/home/models/marketability.dart';
import 'package:bozorlik/features/home/repositories/home_repository.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    final repo = HomeRepository();

    on<GetVersionEvent>((event, emit) async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      try {
        final response = await repo.checkVersion(
          packageName: "uz.bozorlik.app",
          local: version,
        );

        if (response["updateAvailable"] == true) {
          emit(state.copyWith(statusCheck: Status.success));
        }
      } on DioException catch (e) {
        emit(state.copyWith(statusCheck: Status.error));
      }
    });

    on<CreateMarketEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.createMarket(name: event.name);

        if (response['statusCode'].toString() == "201") {
          emit(
            state.copyWith(
              status: Status.success,
              errorMessage: response["message"],
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: Status.error,
              errorMessage: response["message"].toString(),
            ),
          );
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<EditMarketEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.editMarket(name: event.name, id: event.id);

        if (response['statusCode'].toString() == "200") {
          emit(
            state.copyWith(
              status: Status.success,
              errorMessage: response["message"],
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: Status.error,
              errorMessage: response["message"].toString(),
            ),
          );
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });

    on<GetMarketabilityEvent>((event, emit) async {
      emit(state.copyWith(statusMarket: Status.loading));

      try {
        final response = await repo.getMarketability();

        final data = MarketabilityResponse.fromJson(response);
        if (data.message == "ok") {
          emit(
            state.copyWith(statusMarket: Status.success, marketData: data.data),
          );
        } else {
          emit(
            state.copyWith(
              statusMarket: Status.error,
              errorMessageMarket: data.message,
            ),
          );
        }
      } on DioException catch (e) {
        emit(
          state.copyWith(
            statusMarket: Status.error,
            errorMessageMarket: e.toString(),
          ),
        );
      }
    });
    on<GetDepartmentEvent>((event, emit) async {
      emit(state.copyWith(statusDepartment: Status.loading));

      try {
        final response = await repo.getDepartment();

        final data = DepartmentResponse.fromJson(response);
        if (data.message == "ok") {
          if (data.data?.items?.isNotEmpty ?? false) {
            emit(
              state.copyWith(
                statusDepartment: Status.success,
                departmentData: data.data?.items,
              ),
            );
          } else {
            emit(state.copyWith(statusDepartment: Status.empty));
          }
        } else {
          emit(
            state.copyWith(
              statusDepartment: Status.error,
              errorMessageDepartment: data.message,
            ),
          );
        }
      } on DioException catch (e) {
        emit(
          state.copyWith(
            statusDepartment: Status.error,
            errorMessageDepartment: e.toString(),
          ),
        );
      }
    });
    on<GetUnitEvent>((event, emit) async {
      emit(state.copyWith(statusUnits: Status.loading));

      try {
        final response = await repo.getUnit();

        final data = GetAllUnitResponse.fromJson(response);
        if (data.message == "ok") {
          if (data.data?.isNotEmpty ?? false) {
            emit(state.copyWith(statusUnits: Status.success, units: data.data));
          } else {
            emit(state.copyWith(statusUnits: Status.empty));
          }
        } else {
          emit(
            state.copyWith(
              statusUnits: Status.error,
              errorMessageUnits: data.message,
            ),
          );
        }
      } on DioException catch (e) {
        emit(
          state.copyWith(
            statusUnits: Status.error,
            errorMessageUnits: e.toString(),
          ),
        );
      }
    });
    on<GetBannerEvent>((event, emit) async {
      emit(state.copyWith(statusBanner: Status.loading));

      try {
        final response = await repo.getBunner();

        final data = BannerResponse.fromJson(response);
        if (data.message == "ok") {
          if (data.data?.items?.isNotEmpty ?? false) {
            emit(
              state.copyWith(
                statusBanner: Status.success,
                banner: data.data?.items,
              ),
            );
          } else {
            emit(state.copyWith(statusBanner: Status.empty));
          }
        } else {
          emit(
            state.copyWith(
              statusBanner: Status.error,
              errorMessageBanner: data.message,
            ),
          );
        }
      } on DioException catch (e) {
        emit(
          state.copyWith(
            statusBanner: Status.error,
            errorMessageBanner: e.toString(),
          ),
        );
      }
    });
  }
}
