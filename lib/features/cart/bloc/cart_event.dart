part of 'cart_bloc.dart';

class CartEvent {}

class GetCartEvent extends CartEvent {
  final String? marketId;

  GetCartEvent({this.marketId});

}

class DeleteCartEvent extends CartEvent {
  final String marketId;

  DeleteCartEvent({required this.marketId});
}
