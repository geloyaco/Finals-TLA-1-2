import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskNotifier extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title) {
    _tasks.add(Task(title));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
