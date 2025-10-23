part of 'bottomsheet_notification_bloc.dart';

class BottomsheetNotificationEvent {}

class OneReadEvent extends BottomsheetNotificationEvent {
  final String id;

  OneReadEvent({required this.id});
}

class RejectAcceptEvent extends BottomsheetNotificationEvent {
  final String marketId;
  final bool accept;

  RejectAcceptEvent({required this.marketId, required this.accept});
}

