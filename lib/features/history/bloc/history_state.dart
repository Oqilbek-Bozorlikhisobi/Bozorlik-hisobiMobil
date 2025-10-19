part of 'history_bloc.dart';

class HistoryState {
  final String? errorMessage;
  final Status? status;
  final List<HistoryResponseDataData>? items;
  final GetHistoryByIdResponseData? innerHistory;

  HistoryState({this.innerHistory, this.errorMessage, this.status, this.items});

  HistoryState copyWith({
    final String? errorMessage,
    final Status? status,
    final List<HistoryResponseDataData>? items,
    final GetHistoryByIdResponseData? innerHistory,
  }) => HistoryState(
    errorMessage: errorMessage ?? this.errorMessage,
    status: status ?? this.status,
    items: items ?? this.items,
    innerHistory: innerHistory ?? this.innerHistory,
  );
}
