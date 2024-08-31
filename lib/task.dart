class Task {
  int? id;
  String name;
  String? description;
  final DateTime _creationTime;
  DateTime? dueDate;
  bool isComplete = false;
  int priority;
  List<Task>? subtasks;

  Task({
    this.id,
    required this.name,
    this.description,
    this.dueDate,
    this.priority = 0,
  }) : _creationTime = DateTime.now();

  void updateTask(
      {String? newName, String? newDescription, DateTime? newDueDate}) {
    if (newName != null) {
      name = newName;
    }
    if (newDescription != null) {
      description = newDescription;
    }
    if (newDueDate != null) {
      dueDate = newDueDate;
    }
  }

  DateTime get creationTime {
    return _creationTime;
  }

  void addSubtask(
      String name, String? description, DateTime? dueDate, int? priority) {
    subtasks ??= [];
    Task subTask = Task(
        id: id,
        name: name,
        description: description,
        dueDate: dueDate,
        priority: priority ?? 0);
    subtasks!.add(subTask);
  }

  void markAsComplete() {
    isComplete = true;
  }

  void markAsIncomplete() {
    isComplete = false;
  }

  @override
  String toString() {
    return '$name: $description (Created on: $_creationTime, Due: ${dueDate ?? 'No due date'}, isComplete: $isComplete)';
  }
}
