import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/domain/entities/task.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_task_list_use_case.dart';
import 'package:flutter_clean_architecture/shared/extension/iterable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._getTaskListUseCase) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            final tasks = await _getTaskListUseCase.call(
              params: GetTaskListParam(),
            );
            emit(state.copyWith(pageStatus: PageStatus.Loaded, tasks: tasks));
            break;
          case _CompleteTask(task: final task):
            final index = state.tasks.indexWhere((e) => e.id == task.id);
            final newTasks = state.tasks.clone().replace(index, (e) {
              return e.copyWith(isCompleted: !task.isCompleted);
            });
            emit(state.copyWith(tasks: newTasks));
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final GetTaskListUseCase _getTaskListUseCase;
}