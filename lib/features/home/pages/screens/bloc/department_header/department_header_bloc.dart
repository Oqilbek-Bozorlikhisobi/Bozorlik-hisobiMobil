import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/home/pages/screens/bloc/department_header/repo.dart';
import 'package:bozorlik/features/home/pages/screens/bloc/department_header/response.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'department_header_event.dart';

part 'department_header_state.dart';

class DepartmentHeaderBloc
    extends Bloc<DepartmentHeaderEvent, DepartmentHeaderState> {
  DepartmentHeaderBloc() : super(DepartmentHeaderState()) {
    final repo = DepartmentHeaderRepo();
    on<GetDepartmentHeaderEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.getStatistic(
          marketTypeId: event.marketTypeId,
        );
        final data = StatisticResponse.fromJson(response);

        if (data.message == "ok") {
          emit(state.copyWith(status: Status.success, data: data.data));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
