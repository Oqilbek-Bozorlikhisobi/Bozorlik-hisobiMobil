import 'package:bozorlik/features/home/models/banner_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../common/helpers/request_helper.dart';

class HomeRepository {
  final userId = ProfileRepository().id;

  Future<List<BannerModel>> getBanners() async {
    final response = await requestHelper.getWithAuth("/bunner");

    return (response["data"]["items"] as List)
        .map((e) => BannerModel.fromJson(e))
        .toList();
  }

  Future<Map<String, dynamic>> createMarket({required String name}) async {
    try {
      final response = await requestHelper.postWithAuth("/market", {
        "name": name,
        "userId": userId,
      });

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getMarketability() async {
    try {
      final response = await requestHelper.getWithAuth("/market");

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getDepartment() async {
    try {
      final response = await requestHelper.getWithAuth("/market-type");

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getUnit() async {
    try {
      final response = await requestHelper.getWithAuth("/unit/all");

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getBunner() async {
    try {
      final response = await requestHelper.getWithAuth("/bunner");
      await firebase();
      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> firebase() async {
    String? token;
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      token = await messaging.getToken();
      print('Device Token: $token');
    } else {
      print('Push notificationga ruxsat berilmadi');
    }

    try {
      final response = await requestHelper.patchWithAuth(
        "/user/get-fcm-token",
        {"fcmToken": token},
      );

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }
}

final homeRepository = HomeRepository();
