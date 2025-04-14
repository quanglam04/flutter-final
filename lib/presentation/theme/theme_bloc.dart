import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/usecases/check_current_theme_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/remember_theme_use_case.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final CheckCurrentThemeUseCase _checkCurrentThemeUseCase;
  final RememberThemeUseCase _rememberThemeUseCase;
  ThemeBloc(this._checkCurrentThemeUseCase, this._rememberThemeUseCase)
    : super(const ThemeState()) {
    on<ThemeEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            final ThemeMode themeMode = await _checkCurrentThemeUseCase.call(
              params: CheckCurrentThemeParam(),
            );
            emit(state.copyWith(themeMode: themeMode));
            break;
          case _ChangeThemeMode(darkMode: final darkMode):
            if (darkMode) {
              emit(state.copyWith(themeMode: ThemeMode.dark));
              await _rememberThemeUseCase.call(
                params: RememberThemeParam(ThemeMode.dark),
              );
            } else {
              emit(state.copyWith(themeMode: ThemeMode.light));
              await _rememberThemeUseCase.call(
                params: RememberThemeParam(ThemeMode.light),
              );
            }
        }
      } catch (e, s) {
        logger.d(e);
      }
    });
    add(const ThemeEvent.loadData());
  }
}
