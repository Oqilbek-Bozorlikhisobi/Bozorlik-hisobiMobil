part of 'brends_bloc.dart';

class BrendsState {
  final String? errorMessage;
  final Status? status;
  final List<BrendsResponseDataItems>? items;

  BrendsState({this.errorMessage, this.status, this.items});

  BrendsState copyWith({final String? errorMessage, final Status? status,final  List<BrendsResponseDataItems>? items}) =>
      BrendsState(errorMessage: errorMessage ?? this.errorMessage, status: status ?? this.status, items: items ?? this.items);
}
