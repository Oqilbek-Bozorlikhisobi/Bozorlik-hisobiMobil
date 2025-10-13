part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final String? errorMessage;

  HomeState({this.status, this.errorMessage});

  HomeState copyWith({final Status? status, final String? errorMessage}) =>
      HomeState(status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage);
}
