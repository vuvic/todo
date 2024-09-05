import './task.dart';
import './work_item.dart';

class Project extends WorkItem<Project> {
  final List<Task> _tasks = [];

  Project({required super.name, super.id});

  List<Task> get tasks => _tasks;

  DateTime get creationTime => super.creationTime;

  void addTask(Task task) {
    if (_tasks.contains(task)) {
      throw ArgumentError(
          "Task with _id '${task.id}' is already in the project.");
    }
    _tasks.add(task);
  }

  void removeTaskById(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }
}
