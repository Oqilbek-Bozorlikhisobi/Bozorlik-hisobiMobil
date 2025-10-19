part of 'history_bloc.dart';

class HistoryState {
  final String? errorMessage;
  final Status? status;
  final List<HistoryResponseDataData>? items;

  HistoryState({this.errorMessage, this.status, this.items});

  HistoryState copyWith({final String? errorMessage, final Status? status, final List<HistoryResponseDataData>? items}) =>
      HistoryState(errorMessage: errorMessage ?? this.errorMessage, status: status ?? this.status, items: items ?? this.items);
}
