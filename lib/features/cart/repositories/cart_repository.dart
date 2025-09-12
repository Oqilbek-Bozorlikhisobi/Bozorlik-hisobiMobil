import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';

import '../../../common/helpers/request_helper.dart';
import '../../products/models/product_model.dart';

class CartRepository {
  Future<dynamic> createCart({required String name}) async {
    final userId = ProfileRepository().id;

    final response = await requestHelper.postWithAuth("/market", {
      "name": name,
      "userId": userId,
    });
  }

  Future<dynamic> shareCart({
    required String cartId,
    required String phoneNumber,
  }) async {
    final response = await requestHelper.patchWithAuth("/market/add/user", {
      "marketId": cartId,
      "phoneNumber": phoneNumber,
    });
  }

  Future<CartModel> getCart() async {
    final response = await requestHelper.getWithAuth("/market/current");

    return CartModel.fromJson(response["data"]);
  }

  Future<dynamic> changeCurrentCart({required String cartId}) async {
    final response = await requestHelper.patchWithAuth(
      "/market/do-current/$cartId",
      {},
    );

    return response;
  }

  Future<dynamic> changeLocation({
    required String cartId,
    required String? location,
    required String name,
  }) async {
    final response = await requestHelper.patchWithAuth("/market/$cartId", {
      "location": location,
      "name": name,
    });

    return response;
  }

  Future<List<CartModel>> getAllCarts() async {
    final response = await requestHelper.getWithAuth("/market");

    return (response["data"] as List)
        .map((e) => CartModel.fromJson(e))
        .toList();
  }

  Future<dynamic> buyProduct({
    required String productId,
    required String price,
  }) async {
    final response = await requestHelper.patchWithAuth(
      "/market-list/check-is-buying/$productId",
      {"price": price},
    );
  }

  Future<dynamic> deleteProduct({required String productId}) async {
    final response = await requestHelper.deleteWithAuth(
      "/market-list/$productId",
    );
  }

  Future<dynamic> deleteCart({required String cartId}) async {
    final response = await requestHelper.deleteWithAuth("/market/$cartId");
  }

  Future<dynamic> finishCart({
    required String cartId,
    String? location,
    required String name,
  }) async {
    if (location != null) {
      final locationResponse = await updateCart(
        cartId: cartId,
        name: name,
        location: location,
      );
    }
    final response = await requestHelper.postWithAuth("/history", {
      "marketId": cartId,
    });
  }

  Future<dynamic> updateCart({
    required String cartId,
    required String? location,
    required String name,
  }) async {
    final locationResponse = await cartRepository.changeLocation(
      cartId: cartId,
      name: name,
      location: location,
    );
  }

  Future<CartModel> createCartByHistory({required String historyId}) async {
    final userId = ProfileRepository().id;
    final response = await requestHelper.postWithAuth(
      "/market/create-by-history-id",
      {"historyId": historyId, "userId": userId},
    );
    return CartModel.fromJson(response["data"]);
  }

  Future<dynamic> addProductToCart({
    required String cartId,
    required String unitId,
    required ProductModel? product,
    required String? name,
    required double amount,
  }) async {
    final response = await requestHelper.postWithAuth("/market-list", {
      "marketId": cartId,
      "productId": product?.id,
      "productName": name,
      "quantity": amount,
      "unitId": unitId,
    });

    return response;
  }
}

final cartRepository = CartRepository();
