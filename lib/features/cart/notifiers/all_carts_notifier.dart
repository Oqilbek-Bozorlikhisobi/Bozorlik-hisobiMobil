import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/cart/repositories/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_carts_notifier.g.dart';

@riverpod
class AllCartsNotifier extends _$AllCartsNotifier {
  @override
  FutureOr<List<CartModel>> build() async {
    ref.keepAlive();
    return cartRepository.getAllCarts();
  }

  Future<dynamic> changeCurrentCart({required String cartId}) async {
    final response = await cartRepository.changeCurrentCart(cartId: cartId);

    final newState =
        state.value!.map((e) {
          if (e.id == cartId) {
            return e.copyWith(isCurrent: true);
          } else {
            return e.copyWith(isCurrent: false);
          }
        }).toList();
    state = AsyncData(newState);
  }

  Future<void> deleteCart({required String cartId}) async {
    state = AsyncData(state.value!.where((e) => e.id != cartId).toList());
    final response = await cartRepository.deleteCart(cartId: cartId);
    ref.invalidate(allCartsNotifierProvider);
  }
}
