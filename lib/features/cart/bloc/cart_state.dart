part of 'cart_bloc.dart';

class CartState {
  final List<CartResponseData>? data;
  final Status? status;
  final Status? statusDelete;
  final String? errorMessage;

  CartState({this.data, this.status, this.errorMessage,this.statusDelete});

  CartState copyWith({final List<CartResponseData>? data, final Status? status, final String? errorMessage,  final Status? statusDelete}) =>
      CartState(data: data ?? this.data, status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage,statusDelete:statusDelete??this.statusDelete);
}
