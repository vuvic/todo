import 'provider.dart';
import 'package:todo/models/work_item.dart';

abstract class WorkItemProvider<
        T extends WorkItem<dynamic>> // needs to be implemented
    extends Provider<T> {
  List<T> items = [];

  @override
  void fetchAll();

  @override
  void add(T item) {}

  @override
  void update(T item) {}

  @override
  void delete(String id) {}
}
