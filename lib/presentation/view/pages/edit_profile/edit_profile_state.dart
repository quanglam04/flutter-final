part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState extends BaseState with _$EditProfileState {
  const EditProfileState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}