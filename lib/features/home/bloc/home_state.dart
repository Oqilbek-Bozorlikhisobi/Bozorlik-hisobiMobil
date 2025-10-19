part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final Status? statusBanner;
  final Status? statusMarket;
  final Status? statusDepartment;
  final String? errorMessage;
  final String? errorMessageBanner;
  final String? errorMessageMarket;
  final String? errorMessageDepartment;
  final List<MarketabilityResponseData>? marketData;
  final List<DepartmentResponseDataItems>? departmentData;
  final List<BannerResponseDataItems>? banner;
  final List<GetAllUnitResponseData>? units;
  final Status? statusUnits;
  final String? errorMessageUnits;

  HomeState({
    this.statusBanner,
    this.statusUnits,
    this.errorMessageUnits,
    this.units,
    this.banner,
    this.errorMessageBanner,
    this.departmentData,
    this.statusDepartment,
    this.errorMessageDepartment,
    this.status,
    this.errorMessage,
    this.statusMarket,
    this.errorMessageMarket,
    this.marketData,
  });

  HomeState copyWith({
    final Status? status,
    final Status? statusBanner,
    final String? errorMessage,
    final String? errorMessageBanner,

    final Status? statusDepartment,
    final Status? statusMarket,
    final String? errorMessageMarket,
    final List<MarketabilityResponseData>? marketData,
    final String? errorMessageDepartment,
    final List<DepartmentResponseDataItems>? departmentData,
    final List<BannerResponseDataItems>? banner,

    final List<GetAllUnitResponseData>? units,
    final Status? statusUnits,
    final String? errorMessageUnits,
  }) => HomeState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    statusMarket: statusMarket ?? this.statusMarket,
    errorMessageMarket: errorMessageMarket ?? this.errorMessageMarket,
    marketData: marketData ?? this.marketData,
    statusDepartment: statusDepartment ?? this.statusDepartment,
    errorMessageDepartment: errorMessageDepartment ?? this.errorMessageDepartment,
    departmentData: departmentData ?? this.departmentData,
    statusBanner: statusBanner ?? this.statusBanner,
    banner: banner ?? this.banner,
    errorMessageBanner: errorMessageBanner ?? this.errorMessageBanner,
    units: units ?? this.units,
    statusUnits: statusUnits ?? this.statusUnits,
    errorMessageUnits: errorMessageUnits ?? this.errorMessageUnits,
  );
}
