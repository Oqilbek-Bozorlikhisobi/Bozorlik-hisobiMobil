import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/models/inner_cart_response.dart';
import 'package:bozorlik/features/cart/repositories/cart_repo2.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'inner_cart_event.dart';
part 'inner_cart_state.dart';

class InnerCartBloc extends Bloc<InnerCartEvent, InnerCartState> {
  InnerCartBloc() : super(InnerCartState()) {
    final repo = CartRepository2();
    on<GetInnerByIdEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.getInnerCartById(id: event.id);

        final data = GetInnerCartResponse.fromJson(response);

        if (data.message == "ok") {
          emit(state.copyWith(status: Status.success, data: data.data));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
