part of 'task_detail_bloc.dart';

@freezed
sealed class TaskDetailEvent with _$TaskDetailEvent {
  const factory TaskDetailEvent.loadData() = _LoadData;
}