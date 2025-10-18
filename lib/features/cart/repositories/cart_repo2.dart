import 'package:bozorlik/common/helpers/request_helper.dart';

class CartRepository2 {
  Future<Map<String, dynamic>> getAllCarts() async {
    final response = await requestHelper.getWithAuth("/market");

    return response;
  }

  Future<Map<String, dynamic>> getInnerCartById({required String id}) async {
    final response = await requestHelper.getWithAuth("/market/$id");

    return response;
  }
}
