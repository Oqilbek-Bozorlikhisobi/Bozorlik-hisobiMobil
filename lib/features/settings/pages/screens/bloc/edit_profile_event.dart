part of 'edit_profile_bloc.dart';

 class EditProfileEvent {}

class SaveEditEvent extends EditProfileEvent{
  final String fullName;
  final String region;
  final String gender;

  SaveEditEvent({required this.fullName, required this.region, required this.gender,});

}
