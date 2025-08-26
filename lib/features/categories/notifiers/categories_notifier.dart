import 'package:bozorlik/common/models/pagination_model.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';
import 'package:bozorlik/features/categories/repositories/categories_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_notifier.g.dart';

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  FutureOr<PaginationModel<CategoryModel>> build({required int page}) async {
    ref.keepAlive();
    return categoriesRepository.getCategories(page: page);
  }
}
