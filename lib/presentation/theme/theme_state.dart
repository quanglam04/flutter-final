part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState({this.themeMode = ThemeMode.light});
  final ThemeMode themeMode;
}
