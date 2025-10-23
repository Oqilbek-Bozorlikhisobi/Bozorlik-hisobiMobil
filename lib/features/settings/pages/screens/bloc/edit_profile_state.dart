part of 'edit_profile_bloc.dart';

class EditProfileState {
  final Status? status;
  final String? errorMessage;

  EditProfileState({this.status, this.errorMessage});

  EditProfileState copyWith({final Status? status, final String? errorMessage}) =>
      EditProfileState(status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage);
}
