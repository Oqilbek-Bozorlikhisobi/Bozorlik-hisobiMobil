part of 'inner_cart_bloc.dart';

class InnerCartEvent {}

class GetInnerByIdEvent extends InnerCartEvent {
  final String id;

  GetInnerByIdEvent({required this.id});
}

class BuyProductEvent extends InnerCartEvent {
  final MarketLists buyProduct;

  BuyProductEvent({required this.buyProduct});
}

class DeleteProductEvent extends InnerCartEvent {
  final String id;

  DeleteProductEvent({required this.id});
}

class AddNewProduct extends InnerCartEvent {
  final String marketId;
  final String productName;
  final String quantity;
  final String unitId;
  final String description;

  AddNewProduct({required this.marketId, required this.productName, required this.quantity, required this.unitId, required this.description});
}

class AddNewProductLocalEvent extends InnerCartEvent {
  final MarketLists buyProduct;

  AddNewProductLocalEvent({required this.buyProduct});
}

class MarketListCheckEvent extends InnerCartEvent {
  final String id;
  final num price;
  final String calculationType;

  MarketListCheckEvent({required this.id, required this.price, required this.calculationType});
}
