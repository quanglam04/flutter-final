import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'explore_bloc.freezed.dart';
part 'explore_event.dart';
part 'explore_state.dart';

@injectable
class ExploreBloc extends BaseBloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(const ExploreState()) {
    on<ExploreEvent>((event, emit) async {
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