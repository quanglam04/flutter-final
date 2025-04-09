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
  SettingBloc() : super(const SettingState()) {
    on<SettingEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
}