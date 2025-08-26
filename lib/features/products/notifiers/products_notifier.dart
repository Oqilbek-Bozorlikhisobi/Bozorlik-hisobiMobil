import 'package:bozorlik/common/models/pagination_model.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/repositories/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_notifier.g.dart';

@riverpod
class ProductsNotifier extends _$ProductsNotifier {
  @override
  FutureOr<PaginationModel<ProductModel>> build({
    required int page,
    String? categoryId,
    String? search,
  }) async {
    return productsRepository.getProducts(
      page: page,
      categoryId: categoryId??"",
      search: search,
    );
  }
}
