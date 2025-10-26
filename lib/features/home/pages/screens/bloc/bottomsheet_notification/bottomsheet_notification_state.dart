part of 'bottomsheet_notification_bloc.dart';

class BottomsheetNotificationState {

  final Status? status;
  final String? errorMessage;
  final NotificationResponseDataItems? data;

  BottomsheetNotificationState({this.status, this.errorMessage,this.data});
  BottomsheetNotificationState copyWith({

    final Status? status,
    final String? errorMessage,
    final NotificationResponseDataItems? data
  })=>BottomsheetNotificationState(
    status: status??this.status,
    errorMessage: errorMessage??this.errorMessage,
    data: data??this.data,
  );
}

