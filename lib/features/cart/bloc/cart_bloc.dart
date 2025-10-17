import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/repositories/cart_repo2.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    final repo=CartRepository2();

    on<GetCartEvent>((event, emit) async{
    });
  }
}
