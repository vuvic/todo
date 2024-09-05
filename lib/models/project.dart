import './task.dart';

class Project {
  int? _id;
  String _name;
  final List<Task> _tasks = [];
  final List<Project> _subProjects = [];
  final DateTime _creationTime;

  Project({
    required String name,
    int? id,
  })  : _name = name,
        _id = id,
        _creationTime = DateTime.now();

  String get name => _name;
  int? get id => _id;
  List<Task> get tasks => _tasks;
  List<Project> get subProjects => _subProjects;
  DateTime get creationTime => _creationTime;

  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError("Name cannot be empty.");
    }
    _name = value;
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

  void addSubProject(Project subProject) {
    if (this == subProject) {
      throw ArgumentError("A project cannot be a subproject of itself.");
    }

    if (_hasCircularReference(subProject)) {
      throw ArgumentError("Circular reference detected.");
    }

    if (_subProjects.contains(subProject)) {
      throw ArgumentError("Subproject already exists.");
    }

    _subProjects.add(subProject);
  }

  void removeSubProjectByID(int id) {
    _subProjects.removeWhere((subProject) => subProject._id == id);
  }

  bool _hasCircularReference(Project project) {
    if (project == this) return true;
    for (var sub in project._subProjects) {
      if (_hasCircularReference(sub)) return true;
    }
    return false;
  }
}
