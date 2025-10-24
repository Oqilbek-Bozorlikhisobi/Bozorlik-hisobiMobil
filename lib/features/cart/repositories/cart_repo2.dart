import 'package:bozorlik/common/helpers/request_helper.dart';

class CartRepository2 {
  Future<Map<String, dynamic>> getAllCarts() async {
    final response = await requestHelper.getWithAuth("/market");

    return response;
  }
  Future<Map<String, dynamic>> deleteCart({required String id}) async {
    final response = await requestHelper.deleteWithAuth("/market/$id");

    return response;
  }

  Future<Map<String, dynamic>> getInnerCartById({required String id}) async {
    final response = await requestHelper.getWithAuth("/market/$id");

    return response;
  }
  Future<Map<String, dynamic>> deleteUserById({required String deletedUserId,required String marketId}) async {
    final response = await requestHelper.patchWithAuth("/market/delete/user",{
      "deletedUserId": deletedUserId,
      "marketId": marketId
    });

    return response;
  }
  Future<Map<String, dynamic>> deleteCartById({required String id}) async {
    final response = await requestHelper.deleteWithAuth("/market-list/$id");

    return response;
  }

  Future<Map<String, dynamic>> addProduct({
    required String marketId,
    required String productName,
    required String? productId,
    required String quantity,
    required String unitId,
    required String description,
  }) async {
    final response = await requestHelper.postWithAuth("/market-list", {
      "marketId": marketId,
      "productId": productId,
      "productName": productName,
      "quantity": quantity,
      "unitId": unitId,
      "description": description,
    });

    return response;
  }

  Future<Map<String, dynamic>> check({required String id, required num price, required String calculationType}) async {
    print("===================");
    print("${id}");
    print("===================");
    final response = await requestHelper.patchWithAuth("/market-list/check-is-buying/$id", {"price": price, "calculationType": calculationType});

    return response;
  }
}
