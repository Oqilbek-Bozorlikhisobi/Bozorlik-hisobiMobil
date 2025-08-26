import 'package:bozorlik/features/settings/models/profile_model.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<ProfileModel> build() async {
    return profileRepository.getProfile();
  }
}
