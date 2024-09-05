import './task.dart';
import './work_item.dart';

class Project extends WorkItem<Project> {
  final List<Task> _tasks = [];

  Project({required super.name, super.id});

  List<Task> get tasks => _tasks;

  DateTime get creationTime => super.creationTime;

  @override
  set name(String name) {
    if (name.isEmpty) {
      throw ArgumentError("Name cannot be empty.");
    }
    super.name = name;
  }

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

  @override
  void addChild(Project child) {
    if (this == child) {
      throw ArgumentError("A project cannot be a child of itself.");
    }

    if (super.hasCircularReference(child)) {
      throw ArgumentError("Circular reference detected.");
    }

    if (super.children.contains(child)) {
      throw ArgumentError("child already exists.");
    }

    super.children.add(child);
  }

  @override
  void removechildById(int id) {
    super.children.removeWhere((child) => child.id == id);
  }
}
