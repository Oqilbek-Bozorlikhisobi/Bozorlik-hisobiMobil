part of 'history_bloc.dart';

class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {}

class GetByIdHistoryEvent extends HistoryEvent {
  final String historyId;

  GetByIdHistoryEvent({required this.historyId});
}

class NextGetHistoryEvent extends HistoryEvent {}
