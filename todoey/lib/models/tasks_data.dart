import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Vegetables'),
    Task(name: 'Buy Fruits'),
    Task(name: 'Buy meat'),
  ];

  // List<Task> get tasks {
  //   return _tasks;
  // }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCounts {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
