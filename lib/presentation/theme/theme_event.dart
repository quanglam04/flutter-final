part of 'theme_bloc.dart';

@freezed
sealed class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.loadData() = _LoadData;
  const factory ThemeEvent.changeThemeMode(bool darkMode) = _ChangeThemeMode;
}
