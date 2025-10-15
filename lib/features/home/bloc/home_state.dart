part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final Status? statusMarket;
  final String? errorMessage;
  final String? errorMessageMarket;
  final List<MarketabilityResponseData>? marketData;

  HomeState({this.status, this.errorMessage, this.statusMarket, this.errorMessageMarket, this.marketData});

  HomeState copyWith({
    final Status? status,
    final String? errorMessage,
    final Status? statusMarket,
    final String? errorMessageMarket,
    final List<MarketabilityResponseData>? marketData,
  }) => HomeState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    statusMarket: statusMarket ?? this.statusMarket,
    errorMessageMarket: errorMessageMarket ?? this.errorMessageMarket,
    marketData: marketData ?? this.marketData,
  );
}
