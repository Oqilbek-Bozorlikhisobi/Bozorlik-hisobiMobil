import 'package:bozorlik/features/products/models/unit_model.dart';
import 'package:bozorlik/features/products/repositories/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'units_notifier.g.dart';

@riverpod
class UnitsNotifier extends _$UnitsNotifier {
  @override
  FutureOr<List<UnitModel>> build() async {
    return productsRepository.getUnits();
  }

  List<String> getUnitNames(List<UnitModel> units)  {
    return units.where((e) => e.name != null).map((e) => e.name!).toList();
  }

  UnitModel findUnitByName({
    required String name,
    required List<UnitModel> units,
  })  {
    return units.firstWhere((e) => e.name == name);
  }
}
