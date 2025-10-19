part of 'notification_bloc.dart';

class NotificationState {
  final Status? status;
  final String? errorMessage;
  final List<NotificationResponseDataItems>? items;

  NotificationState({this.status, this.errorMessage, this.items});

  NotificationState copyWith({final Status? status, final String? errorMessage, final List<NotificationResponseDataItems>? items}) =>
      NotificationState(status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage, items: items ?? this.items);
}
