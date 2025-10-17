part of 'cart_bloc.dart';

class CartState {
  final List<CartResponseData>? data;
  final Status? status;
  final String? errorMessage;

  CartState({this.data, this.status, this.errorMessage});

  CartState copyWith({final List<CartResponseData>? data, final Status? status, final String? errorMessage}) =>
      CartState(data: data ?? this.data, status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage);
}
