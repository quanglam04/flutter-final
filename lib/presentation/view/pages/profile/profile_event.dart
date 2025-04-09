part of 'profile_bloc.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadData() = _LoadData;
  const factory ProfileEvent.changeTab() = _ChangeTab;
}
