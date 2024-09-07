import './work_item.dart';

class Task extends WorkItem<Task> {
  String _description;
  DateTime? _dueDate;
  DateTime? _plannedCompletionDate;
  int _priority;
  bool _isComplete;

  Task({
    required super.name,
    super.id,
    String? description,
    DateTime? dueDate,
    int priority = 0,
  })  : _description = (description == null) ? "" : description,
        _isComplete = false,
        _priority = (priority >= 0 && priority <= 5)
            ? priority
            : throw ArgumentError('Priority must be between 0 and 5'),
        _dueDate = (dueDate == null || dueDate.isAfter(DateTime.now()))
            ? dueDate
            : throw ArgumentError('Due date must be after the current time');

  String get description => _description;
  DateTime? get dueDate => _dueDate;
  DateTime? get plannedCompletionDate => _plannedCompletionDate;
  int get priority => _priority;
  bool get isComplete => _isComplete;

  set description(String description) {
    _description = description;
  }

  set dueDate(DateTime? date) {
    if (date == null) {
      _dueDate = null;
      _plannedCompletionDate = null;
      return;
    }

    if (DateTime.now().isAfter(date)) {
      throw ArgumentError('Due date must be after the current time');
    }

    if (_plannedCompletionDate != null &&
        _plannedCompletionDate!.isAfter(date)) {
      throw ArgumentError(
          'Planned completion date must be before or on the due date');
    }

    _dueDate = date;
  }

  set plannedCompletionDate(DateTime? newPlannedDate) {
    if (newPlannedDate == null) {
      _plannedCompletionDate = newPlannedDate;
      return;
    }
    if (newPlannedDate.isBefore(DateTime.now())) {
      throw ArgumentError(
          'Planned completion date must be after the current time');
    }
    if (newPlannedDate.isAfter(DateTime.now())) {
      throw ArgumentError(
          'Planned completion date must be before or on the due date');
    }
  }

  set priority(int value) {
    if (value < 0 || value > 5) {
      throw ArgumentError('Priority must be between 0 and 5');
    }
    _priority = value;
  }

  set isComplete(bool value) {
    _isComplete = value;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();

    map['description'] = _description;
    map['dueDate'] = _dueDate?.toIso8601String();
    map['plannedCompletionDate'] = plannedCompletionDate?.toIso8601String();
    map['priority'] = _priority;
    map['isComplete'] = _isComplete;

    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    Task task = Task(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      dueDate: DateTime.parse(map['dueDate'] as String),
      priority: map['priority'] as int,
    );

    List<Task> childrenList = (map['children'] as List<dynamic>?)
            ?.map((childMap) => Task.fromMap(childMap as Map<String, dynamic>))
            .toList() ??
        [];

    for (Task child in childrenList) {
      task.addChild(child);
    }

    return task;
  }
}
