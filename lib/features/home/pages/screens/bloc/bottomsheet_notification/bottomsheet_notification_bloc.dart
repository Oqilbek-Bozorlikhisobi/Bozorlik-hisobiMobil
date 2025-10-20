import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/home/repositories/notification.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'bottomsheet_notification_event.dart';

part 'bottomsheet_notification_state.dart';

class BottomsheetNotificationBloc extends Bloc<BottomsheetNotificationEvent, BottomsheetNotificationState> {
  BottomsheetNotificationBloc() : super(BottomsheetNotificationState()) {
    final repo = NotificationRepository();
    on<OneReadEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.onRead(id: event.id);
      if(response['message']=="ok"){
        emit(state.copyWith(status: Status.success));
      }

      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
