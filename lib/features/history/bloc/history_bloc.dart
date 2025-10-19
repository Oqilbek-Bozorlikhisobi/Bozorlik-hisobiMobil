import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/history/models/by_id_hiistory_response.dart';
import 'package:bozorlik/features/history/models/get_all_history_response.dart';
import 'package:bozorlik/features/history/repositories/history_repository2.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState()) {
    final repo = HistoryRepository2();

    int currentPage = 0;
    int totalPage = 0;
    List<HistoryResponseDataData> loadData = [];

    on<GetHistoryEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        loadData.clear();
        currentPage = 1;
        final response = await repo.getHistory(page: currentPage);
        final data = HistoryResponse.fromJson(response);

        if (data.message == "ok") {
          loadData = data.data?.data ?? [];
          totalPage = data.data?.totalPages ?? 0;
          if (loadData.isNotEmpty) {
            emit(state.copyWith(status: Status.success, items: loadData));
            currentPage++;
          } else {
            emit(state.copyWith(status: Status.empty));
          }
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<GetByIdHistoryEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.getHistoryById(id: event.historyId);
        final data = GetHistoryByIdResponse.fromJson(response);

        if (data.message == "ok") {
          emit(state.copyWith(status: Status.success, innerHistory: data.data));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<NextGetHistoryEvent>((event, emit) async {
      if (currentPage > totalPage) {
        emit(state.copyWith(status: Status.success));
      } else {
        try {
          final response = await repo.getHistory(page: currentPage);
          final data = HistoryResponse.fromJson(response);

          if (data.message == "ok") {
            loadData.addAll(data.data?.data ?? []);
            totalPage = data.data?.totalPages ?? 0;
            if (loadData.isNotEmpty) {
              emit(state.copyWith(status: Status.success, items: loadData));
              currentPage++;
            } else {
              emit(state.copyWith(status: Status.empty));
            }
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
