import 'dart:io';

import 'package:bozorlik/features/home/models/banner_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../common/helpers/request_helper.dart';

class HomeRepository {
  final userId = ProfileRepository().id;

  // Future<List<BannerModel>> getStatistic({required String marketTypeId}) async {
  //   final response = await requestHelper.getWithAuth("/history/statistics",);
  //
  //   return (response["data"]["items"] as List)
  //       .map((e) => BannerModel.fromJson(e))
  //       .toList();
  // }

  Future<List<BannerModel>> getBanners() async {
    final response = await requestHelper.getWithAuth("/bunner");

    return (response["data"]["items"] as List)
        .map((e) => BannerModel.fromJson(e))
        .toList();
  }

  Future<Map<String, dynamic>> checkVersion({
    required String packageName,
    required String local,
  }) async {
    try {
      final response = await requestHelper.getWithAuth(
        "/version/check?package=$packageName&local=$local",
      );

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> createMarket({
    required String name,
    required String marketId,
  }) async {
    try {
      final response = await requestHelper.postWithAuth("/market", {
        "name": name,
        "userId": userId,
        "marketTypeId": marketId,
      });

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> editMarket({
    required String name,
    required String id,
  }) async {
    try {
      final response = await requestHelper.patchWithAuth("/market/$id", {
        "name": name,
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

      print("##########");
      print("${response.toString()}");
      print("##########");
      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> firebase() async {
    String? token;
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();
    print('📱 Ruxsat holati: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {

      if (Platform.isIOS) {
        token= await messaging.getAPNSToken();
        print('APNS Token: $token');
        await Future.delayed(Duration(seconds: 2));
      }else{

        token = await messaging.getToken();
      }
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
