import 'package:flutter/material.dart';
import 'package:flutter_project_2/features/todo/presentation/providers/to_do_provider.dart';
import 'package:flutter_project_2/features/todo/presentation/widgets/to_do_dialog.dart';
import 'package:flutter_project_2/features/todo/presentation/widgets/to_do_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ConsumerStatefulWidget();
  }
}

class _ConsumerStatefulWidget extends ConsumerState {
  createNewTask(context) {
    return showDialog(
      context: context,
      builder: (ctx) => const ToDoDialog(),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(toDoNotifierProvider.notifier).getAllToDo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(toDoNotifierProvider);

    return LoaderOverlay(
      child: Scaffold(
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
                onChanged: (value) {
                  ref
                      .read(toDoNotifierProvider.notifier)
                      .updateCheckboxToDo(state.toDoList[index].id, context);
                },
                deleteTask: () {
                  ref
                      .read(toDoNotifierProvider.notifier)
                      .deleteToDo(state.toDoList[index].id, context);
                });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewTask(context),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
