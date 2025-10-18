part of 'inner_cart_bloc.dart';

class InnerCartState {
  final CartResponseData? data;
  final Status? status;
  final String? errorMessage;
  final List<MarketLists>? buyProducts;

  InnerCartState({this.buyProducts, this.data, this.status, this.errorMessage});

  InnerCartState copyWith({final CartResponseData? data, final Status? status, final String? errorMessage, final List<MarketLists>? buyProducts}) =>
      InnerCartState(
        data: data ?? this.data,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        buyProducts: buyProducts ?? this.buyProducts,
      );
}
