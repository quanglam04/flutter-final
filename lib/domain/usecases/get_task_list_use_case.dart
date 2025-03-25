import 'package:flutter_clean_architecture/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/task.dart';
import 'use_case.dart';

@injectable
class GetTaskListUseCase extends UseCase<List<Task>, GetTaskListParam> {
  GetTaskListUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  @override
  Future<List<Task>> call({required GetTaskListParam params}) async {
     return _taskRepository.getTasks();
  }
}

class GetTaskListParam {
  GetTaskListParam();
}