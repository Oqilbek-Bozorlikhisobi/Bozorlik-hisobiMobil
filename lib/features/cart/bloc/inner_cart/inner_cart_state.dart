part of 'inner_cart_bloc.dart';

class InnerCartState {
  final Status? statusCheck;
  final String? errorMessageCheck;
  final Status? status;
  final String? errorMessage;
  final List<MarketLists>? buyProducts;
  final List<MarketLists>? unBuyProducts;
  final Status? statusAddProduct;
  final String? errorMessageAddProduct;
  final MarketLists? addNewProduct;

  InnerCartState(  {this.addNewProduct,this.statusCheck, this.errorMessageCheck,this.statusAddProduct, this.errorMessageAddProduct, this.unBuyProducts, this.buyProducts, this.status, this.errorMessage});

  InnerCartState copyWith({
    final CartResponseData? data,
    final Status? status,
    final String? errorMessage,
    final List<MarketLists>? buyProducts,
    final List<MarketLists>? unBuyProducts,
    final Status? statusAddProduct,
    final String? errorMessageAddProduct,
    final Status? statusCheck,
    final String? errorMessageCheck,
    final MarketLists? addNewProduct
  }) => InnerCartState(
    statusCheck: statusCheck ?? this.statusCheck,
    addNewProduct: addNewProduct ?? this.addNewProduct,
    errorMessageCheck: errorMessageCheck ?? this.errorMessageCheck,
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    buyProducts: buyProducts ?? this.buyProducts,
    unBuyProducts: unBuyProducts ?? this.unBuyProducts,
    statusAddProduct: statusAddProduct ?? this.statusAddProduct,
    errorMessageAddProduct: errorMessageAddProduct ?? this.errorMessageAddProduct,
  );
}
