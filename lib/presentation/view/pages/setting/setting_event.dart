part of 'setting_bloc.dart';

@freezed
sealed class SettingEvent with _$SettingEvent {
  const factory SettingEvent.loadData() = _LoadData;
}