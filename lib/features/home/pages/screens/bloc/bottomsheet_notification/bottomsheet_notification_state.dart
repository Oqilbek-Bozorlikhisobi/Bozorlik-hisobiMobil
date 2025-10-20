part of 'bottomsheet_notification_bloc.dart';

class BottomsheetNotificationState {

  final Status? status;
  final String? errorMessage;

  BottomsheetNotificationState({this.status, this.errorMessage});
  BottomsheetNotificationState copyWith({

    final Status? status,
    final String? errorMessage,
})=>BottomsheetNotificationState(
    status: status??this.status,
    errorMessage: errorMessage??this.errorMessage
  );
}

