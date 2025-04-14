import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/theme_repository.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl();

  @override
  Future<String> checkCurrentTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('currentTheme') ?? '';
  }

  @override
  Future<bool> rememberTheme(String currentTheme) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString('currentTheme', currentTheme);
      return true;
    } catch (e) {
      return false;
    }
  }
}
