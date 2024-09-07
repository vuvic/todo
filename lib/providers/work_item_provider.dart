import 'package:flutter/material.dart';
import 'provider.dart';
import 'package:todo/models/work_item.dart';
import '../services/api_service.dart';

abstract class WorkItemProvider<T extends WorkItem<dynamic>> extends Provider<T>
    with ChangeNotifier {
  final ApiService<T> apiService;
  List<T> _items = [];

  WorkItemProvider(this.apiService);

  List<T> get items => List.unmodifiable(_items);

  @override
  Future<void> fetchAll() async {
    try {
      _items = await apiService.fetch();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch _items: ${e.toString()}');
    }
  }

  @override
  Future<void> add(T item) async {
    try {
      T createdItem = await apiService.create(item);
      _items.add(createdItem);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to add item: ${e.toString()}');
    }
  }

  @override
  Future<void> update(T item) async {
    try {
      T updatedItem = await apiService.update(item);
      int index = _items.indexWhere((i) => i.id == item.id);
      if (index != -1) {
        _items[index] = updatedItem;
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Failed to update item: ${e.toString()}');
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await apiService.delete(id);
      _items.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to delete item: ${e.toString()}');
    }
  }
}
