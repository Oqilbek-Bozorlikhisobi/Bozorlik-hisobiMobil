import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/repositories/cart_repo2.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    final repo = CartRepository2();

    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.getAllCarts();

        final data = CartResponse.fromJson(response);

        if (data.message == "ok") {
          if (data.data?.isNotEmpty ?? false) {
            emit(state.copyWith(status: Status.success, data: data.data));
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
    on<DeleteCartEvent>((event, emit) async {
      emit(state.copyWith(statusDelete: Status.loading));

      try {
        final response = await repo.deleteCart(id: event.marketId);

        if (response["message"] == "ok") {
          emit(state.copyWith(statusDelete: Status.success));
          add(GetCartEvent());
        } else {
          emit(state.copyWith(statusDelete: Status.error, errorMessage: response["message"]));
        }
      } on DioException catch (e) {
        emit(state.copyWith(statusDelete: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
