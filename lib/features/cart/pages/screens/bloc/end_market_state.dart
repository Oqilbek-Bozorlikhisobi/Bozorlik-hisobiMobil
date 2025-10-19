part of 'end_market_bloc.dart';

class EndMarketState {
  final Status? status;
  final String? errorMessage;

  EndMarketState({this.status, this.errorMessage});

  EndMarketState copyWith({final Status? status, final String? errorMessage}) =>
      EndMarketState(status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage);
}
