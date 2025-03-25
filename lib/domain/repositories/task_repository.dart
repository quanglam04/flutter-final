import '../entities/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();

  void addTask(Task task);

  void updateTask(Task task);

  void deleteTask(String id);

  Task? getTaskById(String id);
}