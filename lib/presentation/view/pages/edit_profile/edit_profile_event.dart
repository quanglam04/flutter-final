part of 'edit_profile_bloc.dart';

@freezed
sealed class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.loadData() = _LoadData;
}