import 'package:bozorlik/features/home/models/banner_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';

import '../../../common/helpers/request_helper.dart';

class HomeRepository {
  final userId = ProfileRepository().id;

  Future<List<BannerModel>> getBanners() async {
    final response = await requestHelper.getWithAuth("/bunner");

    return (response["data"]["items"] as List).map((e) => BannerModel.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> createMarket({required String name}) async {

    final response = await requestHelper.postWithAuth("/market", {"name": name, "userId": userId});

    return response;
  }

  Future<Map<String, dynamic>> getMarketability() async {
    final response = await requestHelper.getWithAuth("/market");

    return response;
  }
  Future<Map<String, dynamic>> getDepartment() async {
    final response = await requestHelper.getWithAuth("/market-type");

    return response;
  }
  Future<Map<String, dynamic>> getBunner() async {
    final response = await requestHelper.getWithAuth("/bunner");

    return response;
  }
}

final homeRepository = HomeRepository();
