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

    int currentPageAll = 0;
    int totalPageAll = 0;
    int currentPageRead = 0;
    int totalPageRead = 0;
    int currentPageUnRead = 0;
    int totalPageUnRead = 0;
    List<NotificationResponseDataItems> loadDataIItemsAll = [];
    List<NotificationResponseDataItems> loadDataIItemsUnRead = [];
    List<NotificationResponseDataItems> loadDataIItemsRead = [];

    ///all
    on<GetNotificationEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        loadDataIItemsAll.clear();
        currentPageAll = 1;
        final response = await repo.getNotification(page: currentPageAll, isRead: null);

        final data = NotificationResponse.fromJson(response);
        totalPageAll = data.data?.totalPages ?? 0;

        if (data.message == "ok") {
          loadDataIItemsAll = data.data?.items ?? [];

          emit(state.copyWith(status: Status.success, itemsAll: loadDataIItemsAll));
          currentPageAll++;
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<GetNextNotificationEvent>((event, emit) async {
      if (currentPageAll > totalPageAll) {
        emit(state.copyWith(status: Status.success));
      } else {
        try {
          final response = await repo.getNotification(page: currentPageAll, isRead: null);

          final data = NotificationResponse.fromJson(response);
          totalPageAll = data.data?.totalPages ?? 0;

          if (data.message == "ok") {
            loadDataIItemsAll.addAll(data.data?.items ?? []);

            emit(state.copyWith(status: Status.success, itemsAll: loadDataIItemsAll));
          } else {
            emit(state.copyWith(status: Status.error, errorMessage: data.message));
          }
        } on DioException catch (e) {
          emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
        }
      }
    });

    ///unread
    on<GetUnReadNotificationEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        loadDataIItemsUnRead.clear();
        currentPageUnRead = 1;
        final response = await repo.getNotification(page: currentPageUnRead, isRead: false);

        final data = NotificationResponse.fromJson(response);
        totalPageUnRead = data.data?.totalPages ?? 0;

        if (data.message == "ok") {
          loadDataIItemsUnRead = data.data?.items ?? [];

          emit(state.copyWith(status: Status.success, itemsUnRead: loadDataIItemsUnRead));
          currentPageUnRead++;
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<GetNextUnReadNotificationEvent>((event, emit) async {
      if (currentPageUnRead > totalPageUnRead) {
        emit(state.copyWith(status: Status.success));
      } else {
        try {
          final response = await repo.getNotification(page: currentPageUnRead, isRead: false);

          final data = NotificationResponse.fromJson(response);
          totalPageUnRead = data.data?.totalPages ?? 0;

          if (data.message == "ok") {
            loadDataIItemsUnRead.addAll(data.data?.items ?? []);

            emit(state.copyWith(status: Status.success, itemsUnRead: loadDataIItemsUnRead));
          } else {
            emit(state.copyWith(status: Status.error, errorMessage: data.message));
          }
        } on DioException catch (e) {
          emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
        }
      }
    });

    ///read
    on<GetReadNotificationEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        loadDataIItemsRead.clear();
        currentPageRead = 1;
        final response = await repo.getNotification(page: currentPageRead, isRead: true);

        final data = NotificationResponse.fromJson(response);
        totalPageRead = data.data?.totalPages ?? 0;

        if (data.message == "ok") {
          loadDataIItemsRead = data.data?.items ?? [];

          emit(state.copyWith(status: Status.success, itemsRead: loadDataIItemsRead));
          currentPageRead++;
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<GetNextReadNotificationEvent>((event, emit) async {
      if (currentPageRead > totalPageRead) {
        emit(state.copyWith(status: Status.success));
      } else {
        try {
          final response = await repo.getNotification(page: currentPageRead, isRead: true);

          final data = NotificationResponse.fromJson(response);
          totalPageRead = data.data?.totalPages ?? 0;

          if (data.message == "ok") {
            loadDataIItemsRead.addAll(data.data?.items ?? []);

            emit(state.copyWith(status: Status.success, itemsRead: loadDataIItemsRead));
          } else {
            emit(state.copyWith(status: Status.error, errorMessage: data.message));
          }
        } on DioException catch (e) {
          emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
        }
      }
    });
  }
}
