import './task.dart';

class Project {
  String _name;
  List<Task>? _tasks;
  List<Project>? _subProjects;

  Project(this._name, this._tasks, this._subProjects);

  String get name => _name;
  List<Task>? get tasks => _tasks;
  List<Project>? get subProjects => _subProjects;

  void updateProject(
      String? name, List<Task>? tasks, List<Project>? subProjects) {
        if (name != null) {
          _name = name;
        }
        if (tasks != null) {
          _tasks = tasks;
        }
        if (subProjects != null) {
          _subProjects = subProjects;
        }
      }
  
}
