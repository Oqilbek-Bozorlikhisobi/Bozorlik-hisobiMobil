import 'package:bozorlik/features/home/models/banner_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';

import '../../../common/helpers/request_helper.dart';

class HomeRepository {
  Future<List<BannerModel>> getBanners() async {
    final response = await requestHelper.getWithAuth("/bunner");

    return (response["data"]["items"] as List).map((e) => BannerModel.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> createMarket({required String name}) async {
    final userId = ProfileRepository().id;

    final response = await requestHelper.postWithAuth("/market", {"name": name, "userId": userId});

    return response;
  }
}

final homeRepository = HomeRepository();
