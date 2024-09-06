import './task.dart';
import './work_item.dart';

// test commit

class Project extends WorkItem<Project> {
  final List<Task> _tasks = [];

  Project({required super.name, super.id});

  List<Task> get tasks => _tasks;

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
  Map<String, dynamic> toMap() {
    final map = super.toMap();

    map.addAll({
      'tasks': _tasks.map((task) => task.toMap()).toList(),
    });

    return map;
  }

  static Project fromMap(Map<String, dynamic> map) {
    Project project = Project(
      name: map['name'],
      id: map['id'],
    );

    List<Task> tasks = List<Task>.from(
        map['tasks']?.map((taskMap) => Task.fromMap(taskMap)) ?? []);
    tasks.forEach(project.addTask);

    List<Project> children = List<Project>.from(
        map['children']?.map((childMap) => Project.fromMap(childMap)) ?? []);
    children.forEach(project.addChild);

    return project;
  }
}
