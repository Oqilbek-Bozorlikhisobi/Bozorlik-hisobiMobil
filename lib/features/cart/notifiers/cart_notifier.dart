import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/cart/notifiers/all_carts_notifier.dart';
import 'package:bozorlik/features/cart/repositories/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../products/models/product_model.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<CartModel> build() async {
    ref.listen<AsyncValue<List<CartModel>>>(allCartsNotifierProvider, (
      previous,
      next,
    ) {
      next.whenData((carts) {
        final currentCart = carts.firstWhere(
          (e) => e.isCurrent == true,
          orElse: () => CartModel(), // fallback if none is current
        );
        state = AsyncData(currentCart);
      });
    });
    return CartModel();
  }

  void changeCurrentCart({required CartModel cart}) async {
    state = AsyncData(cart);
  }

  Future<void> createCart({required String name}) async {
    state = const AsyncLoading();
    try {
      final response = await cartRepository.createCart(name: name);

      ref.invalidate(allCartsNotifierProvider);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  Future<void> shareCart({required String phoneNumber}) async {
    final response = await cartRepository.shareCart(
      cartId: state.value!.id!,
      phoneNumber: phoneNumber,
    );
  }

  Future<dynamic> addProductToCart({
    required ProductModel? product,
    required String? name,
    required double amount,
    required String unitId,
  }) async {
    if (state.value == null) return;

    final response = await cartRepository.addProductToCart(
      product: product,
      name: name,
      amount: amount,
      cartId: state.value!.id!,
      unitId: unitId,
    );
    ref.invalidate(allCartsNotifierProvider);
  }

  Future<void> buyProduct({
    required String productId,
    required String price,
  }) async {
    final response = await cartRepository.buyProduct(
      productId: productId,
      price: price,
    );
    ref.invalidate(allCartsNotifierProvider);
  }

  Future<void> finishCart({String? location}) async {
    final response = await cartRepository.finishCart(
      cartId: state.value!.id!,
      location: location,
      name: state.value!.name!,
    );
    ref.invalidate(allCartsNotifierProvider);
  }



  Future<void> deleteProduct({required String productId}) async {
    final response = await cartRepository.deleteProduct(productId: productId);
    ref.invalidate(allCartsNotifierProvider);
  }

  Future<void> createCartByHistory({required String historyId}) async {
    state = const AsyncLoading();
    try {
      final response = await cartRepository.createCartByHistory(
        historyId: historyId,
      );
      ref.invalidate(allCartsNotifierProvider);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
