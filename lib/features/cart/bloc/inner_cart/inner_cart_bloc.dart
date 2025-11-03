import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/models/inner_cart_response.dart';
import 'package:bozorlik/features/cart/models/post_product_response.dart' hide MarketLists, Unit;
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
          List<MarketLists> buyProducts = [];
          List<MarketLists> unBuyProducts = [];

          // marketLists ni isBuying holatiga qarab ajratish
          if (data.data?.marketLists != null) {
            for (var product in data.data!.marketLists!) {
              if (product.isBuying == true) {
                buyProducts.add(product);
              } else {
                unBuyProducts.add(product);
              }
            }
          }

          emit(state.copyWith(status: Status.success, unBuyProducts: unBuyProducts, buyProducts: buyProducts));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: data.message));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<BuyProductEvent>((event, emit) {
      var list = state.buyProducts ?? [];
      list.add(event.buyProduct);

      print("===========");
      print(event.buyProduct.calculationType);
      var unBuyList = state.unBuyProducts ?? [];
      unBuyList.removeWhere((v) => v.id == event.buyProduct.id);

      emit(state.copyWith(buyProducts: list, unBuyProducts: unBuyList));
    });
    on<AddNewProduct>((event, emit) async {
      emit(state.copyWith(statusAddProduct: Status.loading));

      try {
        final response = await repo.addProduct(
          marketId: event.marketId,
          productName: event.productName,
          quantity: event.quantity,
          unitId: event.unitId,
          description: event.description,
          productId: event.productId,
        );
        final data = PostProductResponse.fromJson(response);
        if (response["statusCode"].toString() == "201") {
          var product = MarketLists(
            id: data.data?.id ?? "",
            productName: data.data?.productName,
            quantity: (data.data?.quantity) ?? 1,
            unit: Unit(id: data.data?.unit?.id, name: data.data?.unit?.nameUz),
            isBuying: true,
            description: data.data?.description,
          );
          emit(state.copyWith(statusAddProduct: Status.success, addNewProduct: product));
        } else {
          emit(state.copyWith(statusAddProduct: Status.error, errorMessageAddProduct: response["message"].toString()));
        }
      } on DioException catch (e) {
        emit(state.copyWith(statusAddProduct: Status.error, errorMessageAddProduct: e.toString()));
      }
    });
    on<AddNewProductLocalEvent>((event, emit) async {
      var unBuyList = state.unBuyProducts ?? [];
      unBuyList.add(event.buyProduct);
      emit(state.copyWith(unBuyProducts: unBuyList));
    });
    on<DeleteProductEvent>((event, emit) async {
      var unBuyList = state.unBuyProducts ?? [];
      unBuyList.removeWhere((v) => v.id == event.id);

      await repo.deleteCartById(id: event.id);

      emit(state.copyWith(unBuyProducts: unBuyList));
    });

    on<MarketListCheckEvent>((event, emit) async {
      emit(state.copyWith(statusCheck: Status.loading));
      try {
        final response = await repo.check(id: event.id, price: event.price, calculationType: event.calculationType);

        if (response["message"] == "ok") {
          emit(state.copyWith(statusCheck: Status.success));
        } else {
          emit(state.copyWith(statusCheck: Status.error, errorMessage: response["message"].toString()));
        }
      } on DioException catch (e) {
        emit(state.copyWith(statusCheck: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
