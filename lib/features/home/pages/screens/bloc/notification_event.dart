part of 'notification_bloc.dart';

class NotificationEvent {}
class AllReadEvent extends NotificationEvent {
}

class GetNotificationEvent extends NotificationEvent {
  final bool? isRead;

  GetNotificationEvent({this.isRead});
}

class GetNextNotificationEvent extends NotificationEvent {
  final bool? isRead;

  GetNextNotificationEvent({this.isRead});
}

class GetUnReadNotificationEvent extends NotificationEvent {

  GetUnReadNotificationEvent();
}
class GetNextUnReadNotificationEvent extends NotificationEvent {

  GetNextUnReadNotificationEvent();
}

class GetReadNotificationEvent extends NotificationEvent {

  GetReadNotificationEvent();
}

class GetNextReadNotificationEvent extends NotificationEvent {

  GetNextReadNotificationEvent();
}