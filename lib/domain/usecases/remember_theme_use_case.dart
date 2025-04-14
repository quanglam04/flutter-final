import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class RememberThemeUseCase extends UseCase<void, RememberThemeParam> {
  RememberThemeUseCase(this._themeRepository);
  ThemeRepository _themeRepository;

  @override
  Future<bool> call({required RememberThemeParam params}) async {
    String currentTheme;
    if (params.currentThemeMode == ThemeMode.dark)
      currentTheme = 'dark';
    else
      currentTheme = 'light';
    return _themeRepository.rememberTheme(currentTheme);
  }
}

class RememberThemeParam {
  RememberThemeParam(this.currentThemeMode);
  final ThemeMode currentThemeMode;
}
