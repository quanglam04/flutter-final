import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class CheckCurrentThemeUseCase extends UseCase<void, CheckCurrentThemeParam> {
  CheckCurrentThemeUseCase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<ThemeMode> call({required CheckCurrentThemeParam params}) async {
    final String currentTheme = await _themeRepository.checkCurrentTheme();
    if (currentTheme == 'dark') {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}

class CheckCurrentThemeParam {
  CheckCurrentThemeParam();
}
