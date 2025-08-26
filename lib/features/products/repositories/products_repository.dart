import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/models/unit_model.dart';

import '../../../common/helpers/request_helper.dart';
import '../../../common/models/pagination_model.dart';

class ProductsRepository {
  Future<PaginationModel<ProductModel>> getProducts({
    required int page,
    required String categoryId,
    String? search,
  }) async {
    final response = await requestHelper.getWithAuth(
      "/products/?categoryId=$categoryId&page=$page&limit=10&search=${search ?? ""}",
    );
    return PaginationModel.fromJson(
      response["data"],
      (json) => ProductModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<List<UnitModel>> getUnits() async {
    final response = await requestHelper.getWithAuth("/unit/all");
    return (response["data"] as List)
        .map((e) => UnitModel.fromJson(e))
        .toList();
  }
}

final productsRepository = ProductsRepository();
