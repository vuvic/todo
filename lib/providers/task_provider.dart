import '../models/task.dart';
import '../services/task_api_service.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final TaskApiService apiService;
  List<Task> _tasks = [];

  TaskProvider({required this.apiService});

  List<Task> get tasks => List.unmodifiable(_tasks);

  Future<void> loadTasks() async {
    _tasks = await apiService.fetchTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    // creates a task --> database assigns an id --> returns created task with id
    task = await apiService.createTask(task);

    _tasks.add(task);
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await apiService.updateTask(task);
    int index = _tasks.indexWhere((task) => task.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }

  Future<void> deleteTask(int id) async {
    await apiService.deleteTask(id);
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
