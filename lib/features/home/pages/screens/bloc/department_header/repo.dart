import 'package:bozorlik/common/helpers/request_helper.dart';

class DepartmentHeaderRepo {
  Future<Map<String, dynamic>> getStatistic({String? marketTypeId}) async {
    final response = await requestHelper.getWithAuth(
      "/history/statistics?marketTypeId=$marketTypeId",
    );
    return response;
  }
}
