part of 'edit_profile_bloc.dart';

@freezed
sealed class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.loadData() = _LoadData;
  const factory EditProfileEvent.saveProfile({
    required String username,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String bio,
    required String website,
  }) = _SaveProfile;
}
