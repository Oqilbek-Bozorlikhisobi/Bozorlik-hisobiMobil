part of 'bottomsheet_notification_bloc.dart';

 class BottomsheetNotificationEvent {}
 class OneReadEvent extends BottomsheetNotificationEvent{
  final String id;

  OneReadEvent({required this.id});

 }
