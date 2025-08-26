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
    return model;
  }

  Future<dynamic> sendFeedback({required String feedback}) async {
    final response = await requestHelper.postWithAuth("/feedback", {
      "text": feedback,
    });
    return response;
  }

  Future<String> sendOtpForChanging({required String phone}) async {
    final response = await requestHelper.postWithAuth(
      "/user/change/phone-number/$id",
      {"phoneNumber": phone},
    );
    return response["data"]["details"];
  }

  Future<String> resendOtpForChanging({required String phone}) async {
    final response = await requestHelper.postWithAuth(
      "/user/send-otp-again/phone-number/$id",
      {"phoneNumber": phone},
    );
    return response["data"]["details"];
  }

  Future<LoginResponse> verifyOtpForChanging({required OtpState state}) async {
    final response = await requestHelper.patchWithAuth(
      "/user/verify/phone-number/$id",
      state.toJson(),
    );
    return LoginResponse.fromJson(response["data"]);
  }

  String get id => cache.getString("id") ?? "";
}

final profileRepository = ProfileRepository();
