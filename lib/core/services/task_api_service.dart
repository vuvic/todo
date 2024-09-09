import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/task.dart';
import 'api_service.dart';

class TaskApiService extends ApiService<Task> {
  TaskApiService({required String baseUrl}) : super(baseUrl);

  @override
  Future<List<Task>> fetch() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Task.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  @override
  Future<Task> create(Task item) async {
    Map<String, dynamic> data = item.toMap();
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Task.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  @override
  Future<Task> update(Task item) async {
    Map<String, dynamic> data = item.toMap();
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/$data.id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Assuming the API returns the updated task in its response
      return Task.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  @override
  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/tasks/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
