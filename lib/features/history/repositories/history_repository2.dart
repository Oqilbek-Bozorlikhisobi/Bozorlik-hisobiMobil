import 'package:bozorlik/common/helpers/request_helper.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';

class HistoryRepository2{
  Future<Map<String,dynamic>> getHistory({required int page})async{
    final response = await requestHelper.getWithAuth("/history?page=$page&limit=10",);

    return response;
  }
  Future<Map<String,dynamic>> getHistoryById({required String id})async{
    final response = await requestHelper.getWithAuth("/history/$id",);

    return response;
  }
  Future<Map<String,dynamic>> retryMarket({required String historyId})async{

    var userId=ProfileRepository().id;
    final response = await requestHelper.postWithAuth("/market/create-by-history-id",{
      "historyId": historyId,
      "userId": userId
    });

    return response;
  }
}