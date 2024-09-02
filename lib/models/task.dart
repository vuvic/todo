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
    required bool isComplete,
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

  void addSubtask(String name, String? description, DateTime? dueDate,
      int? priority, bool isComplete) {
    subtasks ??= [];
    Task subTask = Task(
        id: id,
        name: name,
        description: description,
        dueDate: dueDate,
        priority: priority ?? 0,
        isComplete: isComplete);
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'creationTime': _creationTime,
      'dueDate': dueDate,
      'isComplete': isComplete ? 1 : 0,
      'priority': priority,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      dueDate: map['dueDate'],
      isComplete: map['isComplete'] == 1,
      priority: map['priority'],
    );
  }
}
