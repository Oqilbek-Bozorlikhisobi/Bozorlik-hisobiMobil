part of 'history_bloc.dart';

class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {
  final String? marketTypeId;

  GetHistoryEvent({this.marketTypeId});
}

class GetByIdHistoryEvent extends HistoryEvent {
  final String historyId;

  GetByIdHistoryEvent({required this.historyId});
}

class NextGetHistoryEvent extends HistoryEvent {}
class RetryMarketEvent extends HistoryEvent {
  final String historyId;

  RetryMarketEvent({required this.historyId});
}
