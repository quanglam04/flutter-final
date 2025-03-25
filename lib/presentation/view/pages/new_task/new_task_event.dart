part of 'new_task_bloc.dart';

@freezed
sealed class NewTaskEvent with _$NewTaskEvent {
  const factory NewTaskEvent.loadData() = _LoadData;
  const factory NewTaskEvent.createTask() = _CreateTask;
}