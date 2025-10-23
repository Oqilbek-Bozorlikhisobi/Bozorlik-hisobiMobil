import 'package:bloc/bloc.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:dio/dio.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileState()) {
    final repo = ProfileRepository();
    on<SaveEditEvent>((event, emit) async {
      final userId = ProfileRepository().id;

      emit(state.copyWith(status: Status.loading));

      try {
        final response = await repo.editProfile(id: userId, fullname: event.fullName, region: event.region, gender: event.gender);

        if (response["statusCode"].toString() == "200") {
          emit(state.copyWith(status: Status.success));
        } else {
          emit(state.copyWith(status: Status.error, errorMessage: response["message"].toString()));
        }
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.loading));
      }
    });
  }
}
