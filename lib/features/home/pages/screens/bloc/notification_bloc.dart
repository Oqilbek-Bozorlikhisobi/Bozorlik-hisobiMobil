import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/home/models/notification/notification.dart';
import 'package:bozorlik/features/home/repositories/notification.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    final repo = NotificationRepository();
    on<GetNotificationEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.getNotification();

        final data = NotificationResponse.fromJson(response);

        if (data.message == "ok") {
          emit(state.copyWith(status: Status.success, items: data.data?.items));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
