import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/models/inner_cart_response.dart';
import 'package:bozorlik/features/cart/repositories/cart_repo2.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

import '../repo/end_market_repo.dart';

part 'end_market_event.dart';

part 'end_market_state.dart';

class EndMarketBloc extends Bloc<EndMarketEvent, EndMarketState> {
  EndMarketBloc() : super(EndMarketState()) {
    final repo = EndMarketRepository();

    final repo2 = CartRepository2();

    on<EndMarketButton>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.endMarket(marketId: event.marketId, location: event.location, name: event.name, marketTypeId: event.marketTypeId);
        final response3 = await repo2.getInnerCartById(id: event.marketId);
        final response2 = await repo.history(marketId: event.marketId,);

        if (response["message"] == "ok"&&response2["statusCode"].toString()=="201"&&response3["message"]=="ok") {
          emit(state.copyWith(status: Status.success));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: response["message"].toString()));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });


  }
}
