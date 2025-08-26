import 'package:bozorlik/features/home/models/banner_model.dart';

import '../../../common/helpers/request_helper.dart';

class HomeRepository {
  Future<List<BannerModel>> getBanners() async {
    final response = await requestHelper.getWithAuth("/bunner");

    return (response["data"]["items"] as List)
        .map((e) => BannerModel.fromJson(e))
        .toList();
  }
}

final homeRepository = HomeRepository();
