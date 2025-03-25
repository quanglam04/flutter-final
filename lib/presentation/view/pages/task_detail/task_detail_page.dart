import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/task.dart';

import '../../../../di/di.dart';
import '../../../base/base_page.dart';
import 'task_detail_bloc.dart';

@RoutePage()
class TaskDetailPage extends BasePage<TaskDetailBloc, TaskDetailEvent, TaskDetailState> {
  TaskDetailPage( {Key? key, required this.task,}) : super(key: key);

  final Task task;

  final TextEditingController _titleController = TextEditingController();
  final bool _hasNotebook = false;
  final bool _followTutorial = false;
  final bool _addSubtask = false;

  @override
  TaskDetailBloc createBloc() {
    return getIt<TaskDetailBloc>(param1: task);
  }

  @override
  void onInitState(BuildContext context) {
    context.read<TaskDetailBloc>().add(const TaskDetailEvent.loadData());
    _titleController.text = task.title;
    super.onInitState(context);
  }

  @override
  void onDispose(BuildContext context) {
    _titleController.dispose();
    super.onDispose(context);
  }

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 24),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _titleController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Task title',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (task.title.contains('notebook'))
                      CheckboxListTile(
                        title: const Text('Get a notebook'),
                        value: _hasNotebook,
                        onChanged: (value) {
                          // setState(() {
                          //   _hasNotebook = value ?? false;
                          // });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    if (task.title.contains('tutorial'))
                      CheckboxListTile(
                        title: const Text('Follow the youtube tutorial'),
                        value: _followTutorial,
                        onChanged: (value) {
                          // setState(() {
                          //   _followTutorial = value ?? false;
                          // });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    if (task.title.contains('Stretch'))
                      CheckboxListTile(
                        title: const Text('Add subtask'),
                        value: _addSubtask,
                        onChanged: (value) {
                          // setState(() {
                          //   _addSubtask = value ?? false;
                          // });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}