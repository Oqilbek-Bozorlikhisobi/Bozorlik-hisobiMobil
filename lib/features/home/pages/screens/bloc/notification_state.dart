part of 'notification_bloc.dart';

class NotificationState {
  final Status? status;
  final String? errorMessage;
  final List<NotificationResponseDataItems>? itemsAll;
  final List<NotificationResponseDataItems>? itemsUnRead;
  final List<NotificationResponseDataItems>? itemsRead;

  NotificationState({this.status, this.errorMessage, this.itemsAll, this.itemsUnRead, this.itemsRead});

  NotificationState copyWith({
    final Status? status,
    final String? errorMessage,
    final List<NotificationResponseDataItems>? itemsAll,
    final List<NotificationResponseDataItems>? itemsUnRead,
    final List<NotificationResponseDataItems>? itemsRead,
  }) => NotificationState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    itemsAll: itemsAll ?? this.itemsAll,
    itemsUnRead: itemsUnRead ?? this.itemsUnRead,
    itemsRead: itemsRead ?? this.itemsRead,
  );
}
