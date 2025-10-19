import 'package:bozorlik/common/helpers/request_helper.dart';

class NotificationRepository {
  Future<Map<String, dynamic>> getNotification() async {
    try {
      final response = await requestHelper.getWithAuth("/notification/user");

      return response;
    } catch (e) {
      return {"==========ERROR========": e.toString()};
    }
  }
}
