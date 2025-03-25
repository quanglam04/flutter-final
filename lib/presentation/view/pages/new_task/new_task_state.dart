part of 'new_task_bloc.dart';

@freezed
class NewTaskState extends BaseState with _$NewTaskState {
  const NewTaskState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.task,
  });

  @override
  final Task? task;
}