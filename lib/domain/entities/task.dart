import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {

  const Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.categoryId,
    this.subtasks = const [],
  });

  factory Task.create({
    required String title,
    required String categoryId,
    List<String> subtasks = const [],
  }) {
    return Task(
      id: const Uuid().v4(),
      title: title,
      categoryId: categoryId,
      subtasks: subtasks,
    );
  }

  final String id;
  final String title;
  final bool isCompleted;
  final String categoryId;
  final List<String> subtasks;

  Task copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    String? categoryId,
    List<String>? subtasks,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      categoryId: categoryId ?? this.categoryId,
      subtasks: subtasks ?? this.subtasks,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted, categoryId, subtasks];
}