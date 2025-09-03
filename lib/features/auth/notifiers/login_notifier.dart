import 'package:bozorlik/features/auth/models/login_response.dart';
import 'package:bozorlik/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/cache.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<LoginResponse?> build() async {
    return null;
  }

  Future<void> login({required String phone, required String password}) async {
    state = const AsyncLoading();
    try {
      final response = await authRepository.login(
        phone: phone,
        password: password,
      );
      state = AsyncData(response);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  Future<void> logout() async {
    final lang = cache.getString("language");
    final onboarded = cache.getBool("onboarded");
    await cache.clear();
    await cache.setString("language", lang ?? "");
    await cache.setBool("onboarded", onboarded ?? false);
  }

  Future<void> deleteAccount() async {
    final lang = cache.getString("language");
    final onboarded = cache.getBool("onboarded");
    await authRepository.deleteAccount();
    await cache.clear();
    await cache.setString("language", lang ?? "");
    await cache.setBool("onboarded", onboarded ?? false);
  }
}
