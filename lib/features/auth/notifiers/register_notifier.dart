import 'package:bozorlik/features/auth/models/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_repository.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void changeFullName(String value) {
    state = state.copyWith(fullName: value);
  }

  void changeRegion(String value) {
    state = state.copyWith(region: value);
  }

  void changeGender(String value) {
    state = state.copyWith(gender: value);
  }

  void changePhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void changePassword(String value) {
    state = state.copyWith(password: value);
  }

  void changeConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  Future<String> post() async {
    final response = await authRepository.register(model: state);
    return response;
  }
}
