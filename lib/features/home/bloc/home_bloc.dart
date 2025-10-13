import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/home/repositories/home_repository.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    final repo = HomeRepository();
    on<CreateMarketEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.createMarket(name: event.name);

        if (response['statusCode'].toString() == "201") {
          emit(state.copyWith(status: Status.success, errorMessage: response["message"]));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: response["message"].toString()));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
