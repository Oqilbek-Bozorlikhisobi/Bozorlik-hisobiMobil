part of 'history_bloc.dart';

class HistoryState {
  final String? errorMessage;
  final Status? status;
  final Status? statusRetry;
  final List<HistoryResponseDataData>? items;
  final GetHistoryByIdResponseData? innerHistory;

  HistoryState({this.innerHistory, this.errorMessage, this.status, this.items,this.statusRetry});

  HistoryState copyWith({
    final String? errorMessage,
    final Status? status,
    final List<HistoryResponseDataData>? items,
    final GetHistoryByIdResponseData? innerHistory,
    final Status? statusRetry
  }) => HistoryState(
    errorMessage: errorMessage ?? this.errorMessage,
    status: status ?? this.status,
    items: items ?? this.items,
    innerHistory: innerHistory ?? this.innerHistory,
    statusRetry: statusRetry ?? this.statusRetry,
  );
}
