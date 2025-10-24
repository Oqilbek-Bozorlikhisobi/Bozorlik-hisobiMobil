import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/pages/market_share/models/get_by_id_market.dart';
import 'package:bozorlik/features/cart/repositories/cart_repo2.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

import '../../../models/cart_response.dart';

part 'market_share_event.dart';

part 'market_share_state.dart';

class MarketShareBloc extends Bloc<MarketShareEvent, MarketShareState> {
  MarketShareBloc() : super(MarketShareState()) {
    final repo = CartRepository2();
    on<GetMarketShareEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.getInnerCartById(id: event.id);
        final data = GetByIdMarketResponse.fromJson(response);
        if (data.message == "ok") {
          emit(state.copyWith(status: Status.success, users: data.data?.users, pendingUsers: data.data?.pendingUsers));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<DeleteUserEvent>((event, emit) async {
      emit(state.copyWith(statusDelete: Status.loading));

      try {
        final response = await repo.deleteUserById(deletedUserId: event.userId, marketId: event.marketId);
        final data = GetByIdMarketResponse.fromJson(response);
        if (data.message == "ok") {
          emit(state.copyWith(statusDelete: Status.success,));
          add(GetMarketShareEvent(id: event.marketId));
        }
      } on DioException catch (e) {
        emit(state.copyWith(statusDelete: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
