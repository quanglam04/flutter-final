import 'package:injectable/injectable.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl();

  final List<Task> _tasks = [
    const Task(
      id: '1',
      title: 'Drink 2 glasses of water',
      categoryId: 'health',
    ),
    const Task(
      id: '2',
      title: 'Edit the PDF',
      categoryId: 'work',
    ),
    const Task(
      id: '3',
      title: 'Write in a gratitude journal',
      categoryId: 'personal',
    ),
    const Task(
      id: '4',
      title: 'Get a notebook',
      categoryId: 'shopping',
    ),
    const Task(
      id: '5',
      title: 'Follow the youtube tutorial',
      categoryId: 'learning',
    ),
    const Task(
      id: '6',
      title: 'Stretch everyday for 15 mins',
      categoryId: 'health',
      subtasks: ['Get a notebook', 'Follow the youtube tutorial'],
    ),
  ];

  List<Task> getTasks() {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  Task? getTaskById(String id) {
    try {
      return _tasks.firstWhere((task) => task.id == id);
    } catch (_) {
      return null;
    }
  }
}