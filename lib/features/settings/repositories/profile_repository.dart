import 'package:bozorlik/db/cache.dart';
import 'package:bozorlik/features/auth/models/login_response.dart';

import '../../../common/helpers/request_helper.dart';
import '../../auth/models/otp_state.dart';
import '../models/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() async {
    final response = await requestHelper.getWithAuth("/user/profile");
    final model = ProfileModel.fromJson(response["data"]);

    await cache.setString("id", model.id ?? "");
    await cache.setString("fullName", model.fullName ?? "");
    await cache.setString("region", model.region ?? "");
    await cache.setString("gender", model.gender ?? "");
    return model;
  }

  Future<dynamic> sendFeedback({required String feedback}) async {
    final response = await requestHelper.postWithAuth("/feedback", {"text": feedback});
    return response;
  }

  Future<Map<String, dynamic>> editProfile({required String id, required String fullname, required String region, required String gender}) async {
    final response = await requestHelper.patchWithAuth("/user/${id}", {"fullName": fullname, "region": region, "gender": gender});
    return response;
  }

  Future<String> sendOtpForChanging({required String phone}) async {
    final response = await requestHelper.postWithAuth("/user/change/phone-number/$id", {"phoneNumber": phone});
    return response["data"]["details"];
  }

  Future<String> resendOtpForChanging({required String phone}) async {
    final response = await requestHelper.postWithAuth("/user/send-otp-again/phone-number/$id", {"phoneNumber": phone});
    return response["data"]["details"];
  }

  Future<LoginResponse> verifyOtpForChanging({required OtpState state}) async {
    final response = await requestHelper.patchWithAuth("/user/verify/phone-number/$id", state.toJson());
    return LoginResponse.fromJson(response["data"]);
  }

  String get id => cache.getString("id") ?? "";
  String get gender => cache.getString("gender") ?? "";
  String get fullName => cache.getString("fullName") ?? "";
  String get region => cache.getString("region") ?? "";
}

final profileRepository = ProfileRepository();
