part of 'profile_bloc.dart';

@freezed
class ProfileState extends BaseState with _$ProfileState {
  const ProfileState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}