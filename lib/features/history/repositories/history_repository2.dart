import 'package:bozorlik/common/helpers/request_helper.dart';

class HistoryRepository2{
  Future<Map<String,dynamic>> getHistory({required int page})async{
    final response = await requestHelper.getWithAuth("/history?page=$page&limit=10",);

    return response;
  }
}