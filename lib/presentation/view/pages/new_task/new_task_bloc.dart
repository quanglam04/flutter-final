import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/task.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'new_task_bloc.freezed.dart';
part 'new_task_event.dart';
part 'new_task_state.dart';

@injectable
class NewTaskBloc extends BaseBloc<NewTaskEvent, NewTaskState> {
  NewTaskBloc() : super(const NewTaskState()) {
    on<NewTaskEvent>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              break;
            case _CreateTask():
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
}