import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/task.dart';

class TaskApiService {
  final String baseUrl;

  TaskApiService({required this.baseUrl});

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Task.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<Task> createTask(Task task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(task.toMap()),
    );

    if (response.statusCode == 201) {
      return Task.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  Future<void> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/${task.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(task.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/tasks/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
