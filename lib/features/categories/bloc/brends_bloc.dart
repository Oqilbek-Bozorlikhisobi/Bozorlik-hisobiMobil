import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/categories/models/brends_response.dart';
import 'package:bozorlik/features/categories/repositories/categories_repository.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'brends_event.dart';

part 'brends_state.dart';

class BrendsBloc extends Bloc<BrendsEvent, BrendsState> {
  BrendsBloc() : super(BrendsState()) {
    final repo = CategoriesRepository();

    int currentPage = 0;
    int totalPage = 0;
    List<BrendsResponseDataItems> loadData = [];

    on<GetBrendsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        loadData.clear();
        currentPage = 1;
        final response = await repo.getBrends(page: currentPage);
        final data = BrendsResponse.fromJson(response);

        if (data.message == "ok") {
          loadData = data.data?.items ?? [];
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
    on<NextGetBrendsEvent>((event, emit) async {

      if(currentPage>totalPage){
        emit(state.copyWith(status: Status.success));
      }else{

      try {
        final response = await repo.getBrends(page: currentPage);
        final data = BrendsResponse.fromJson(response);

        if (data.message == "ok") {
          loadData .addAll( data.data?.items ?? []);
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
