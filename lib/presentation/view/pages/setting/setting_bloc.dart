import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/usecases/check_current_theme_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'setting_bloc.freezed.dart';
part 'setting_event.dart';
part 'setting_state.dart';

@injectable
class SettingBloc extends BaseBloc<SettingEvent, SettingState> {
  final CheckCurrentThemeUseCase _checkCurrentThemeUseCase;
  SettingBloc(this._checkCurrentThemeUseCase) : super(const SettingState()) {
    on<SettingEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            final ThemeMode themeMode = await _checkCurrentThemeUseCase.call(
              params: CheckCurrentThemeParam(),
            );
            if (themeMode == ThemeMode.dark)
              emit(state.copyWith(darkMode: true));
            else
              emit(state.copyWith(darkMode: false));
            break;
          case _ChangeDarkMode():
            emit(state.copyWith(darkMode: !state.darkMode));
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
