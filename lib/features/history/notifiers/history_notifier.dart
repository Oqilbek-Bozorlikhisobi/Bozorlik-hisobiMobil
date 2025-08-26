import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/history/repositories/history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_notifier.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  FutureOr<List<CartModel>> build() async {
    return historyRepository.getHistory();
  }
}
