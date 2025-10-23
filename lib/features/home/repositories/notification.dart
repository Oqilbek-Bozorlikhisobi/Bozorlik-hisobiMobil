import 'package:bozorlik/common/helpers/request_helper.dart';

class NotificationRepository {
  Future<Map<String, dynamic>> getNotification({
    required int page,
    required bool? isRead,
  }) async {
    try {
      final response = await requestHelper.getWithAuth(
        "/notification/user/?page=$page&limit=10&isRead=$isRead",
      );

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> onRead({required String id}) async {
    try {
      final response = await requestHelper.getWithAuth("/notification/$id");

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> acceptReject({
    required String marketId,
    required bool accept,
  }) async {
    try {
      final response = await requestHelper.patchWithAuth(
        "/market/respond/to-invite",
        {"marketId": marketId, "accept": accept},
      );

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }

  Future<Map<String, dynamic>> allRead() async {
    try {
      final response = await requestHelper.patchWithAuth(
        "/notification/do-all-read",
        {},
      );

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }
}
