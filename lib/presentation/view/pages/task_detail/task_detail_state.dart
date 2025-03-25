part of 'task_detail_bloc.dart';

@freezed
class TaskDetailState extends BaseState with _$TaskDetailState {
  const TaskDetailState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    required this.task,
  });

  @override
  final Task task;
}