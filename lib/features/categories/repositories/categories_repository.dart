import 'package:bozorlik/common/models/pagination_model.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';

import '../../../common/helpers/request_helper.dart';

class CategoriesRepository {
  Future<PaginationModel<CategoryModel>> getCategories({
    required int page,
  }) async {
    final response = await requestHelper.getWithAuth(
      "/category?page=$page&limit=10",
    );
    return PaginationModel.fromJson(
      response["data"],
      (json) => CategoryModel.fromJson(json as Map<String, dynamic>),
    );
  }

}

final categoriesRepository = CategoriesRepository();
