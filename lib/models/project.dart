import './task.dart';

class Project {
  String name;
  List<Task>? tasks;
  List<Project>? subProjects;

  Project({
    required this.name,
    this.tasks,
    this.subProjects,
  });
}
