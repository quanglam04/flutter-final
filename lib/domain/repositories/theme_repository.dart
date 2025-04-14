abstract class ThemeRepository {
  Future<String> checkCurrentTheme();
  Future<bool> rememberTheme(String currentTheme);
}
