import 'package:flutter/material.dart';
import 'package:flutter_project_2/features/todo/domain/entities/to_do_info.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/to_do_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoDialog extends ConsumerStatefulWidget {
  const ToDoDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ToDoDialog();
  }
}

class _ToDoDialog extends ConsumerState<ToDoDialog> {
  final TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(toDoNotifierProvider.notifier);
    final state = ref.watch(toDoNotifierProvider);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan Task",
              ),
            ),
            const SizedBox(height: 50),
            MaterialButton(
              onPressed: () async {
                // Save the task when the button is pressed
                if (!state.isLoading) {
                  final task = ToDoInfo(
                      id: '0', isCompleted: false, text: taskController.text);
                  notifier.createTodo(task);
                }
              },
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
