import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/task.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'task_detail_bloc.freezed.dart';
part 'task_detail_event.dart';
part 'task_detail_state.dart';

@injectable
class TaskDetailBloc extends BaseBloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc(@factoryParam this.task) : super(TaskDetailState(task: task)) {
    on<TaskDetailEvent>((event, emit) async {
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

  final Task task;
}