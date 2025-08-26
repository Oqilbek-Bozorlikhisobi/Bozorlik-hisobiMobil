import 'package:bozorlik/features/home/models/banner_model.dart';
import 'package:bozorlik/features/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banners_notifier.g.dart';

@riverpod
class BannersNotifier extends _$BannersNotifier {
  @override
  FutureOr<List<BannerModel>> build() async {
    return homeRepository.getBanners();
  }
}
