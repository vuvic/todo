abstract class WorkItem<T extends WorkItem<T>> {
  final int? _id;
  String _name;
  final List<WorkItem> _children = [];
  final DateTime _creationTime;

  WorkItem({
    required String name,
    int? id,
  })  : _name = name,
        _id = id,
        _creationTime = DateTime.now();

  int? get id => _id;
  String get name => _name;
  List<WorkItem> get children => _children;
  DateTime get creationTime => _creationTime;

  set name(String name) {
    if (name.isEmpty) {
      throw ArgumentError("Name cannot be empty.");
    }
    _name = name;
  }

  bool _hasCircularReference(WorkItem workItem) {
    if (workItem == this) return true;
    for (var sub in workItem._children) {
      if (_hasCircularReference(sub)) return true;
    }
    return false;
  }

  void addChild(T child) {
    if (this == child) {
      throw ArgumentError("A project cannot be a child of itself.");
    }

    if (_hasCircularReference(child)) {
      throw ArgumentError("Circular reference detected.");
    }

    if (_children.contains(child)) {
      throw ArgumentError("child already exists.");
    }
  }

  void removechildById(int id) {
    _children.removeWhere((child) => child._id == id);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'creationTime': creationTime.toIso8601String(),
      'children':
          _children.map((child) => child.toMap()).toList(), // Map children too
    };
  }

  static WorkItem fromMap(Map<String, dynamic> map) {
    throw UnimplementedError("fromMap should be implemented in subclasses.");
  }
}
