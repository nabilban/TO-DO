import 'package:flutter/material.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/to_do_provider.dart';
import 'package:flutter_project_2/features/todo/presentation/widgets/to_do_dialog.dart';
import 'package:flutter_project_2/features/todo/presentation/widgets/to_do_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  createNewTask(context) {
    return showDialog(
      context: context,
      builder: (ctx) => const ToDoDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(toDoNotifierProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 148, 148, 148),
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(246, 226, 159, 71),
      ),
      body: ListView.builder(
        itemCount: state.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
              taskName: state.toDoList[index].text,
              taskCompleted: state.toDoList[index].isCompleted,
              onChanged: (value) {},
              deleteTask: () {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(context),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(Icons.add),
      ),
    );
  }
}
