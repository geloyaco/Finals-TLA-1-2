import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskNotifier.tasks.length,
              itemBuilder: (context, index) {
                final task = taskNotifier.tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          ref
                              .read(taskNotifierProvider.notifier)
                              .toggleTaskCompletion(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          ref
                              .read(taskNotifierProvider.notifier)
                              .deleteTask(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  ref
                      .read(taskNotifierProvider.notifier)
                      .addTask(value);
                }
              },
              decoration: InputDecoration(
                labelText: 'Add a Task',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
