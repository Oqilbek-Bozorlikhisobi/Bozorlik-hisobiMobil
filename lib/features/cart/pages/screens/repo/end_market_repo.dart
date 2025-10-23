import 'package:bozorlik/common/helpers/request_helper.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:dio/dio.dart';

class EndMarketRepository {
  Future<Map<String, dynamic>> endMarket({
    required String marketId,
    required String location,
    required String name,
    required String marketTypeId,
  }) async {
    final response = await requestHelper.patchWithAuth("/market/$marketId", {
      "location": location,
      "name": name,
      "marketTypeId": marketTypeId,
    });

    return response;
  }

  Future<Map<String, dynamic>> history({required String marketId}) async {
    try {
      final response = await requestHelper.postWithAuth("/history", {
        "marketId": marketId.toString(),
      });
      return response;
    } catch (e) {
      // 400 xatosini boshqarish
      if (e is DioException && e.response?.statusCode == 400) {
        // Foydalanuvchiga tushunarli xabar qaytaring
        showCustomToast(
          title: e.response?.data['message'] ?? 'Market not available',
        );
        return {
          'error': true,
          'message': e.response?.data['message'] ?? 'Market not available',
        };
      }
      rethrow;
    }
  }
}
