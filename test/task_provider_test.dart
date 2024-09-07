// Import necessary packages
import 'package:mockito/annotations.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/services/task_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/task.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/extensions/date_time_extensions.dart';

// Generate mock for TaskApiService
@GenerateMocks([TaskApiService])
import 'task_provider_test.mocks.dart';

void main() {
  group('TaskProvider Tests', () {
    late TaskProvider taskProvider;
    late MockTaskApiService mockApiService; // Use the generated mock

    setUp(() {
      mockApiService = MockTaskApiService();
      taskProvider = TaskProvider(apiService: mockApiService);
    });

    test('Fetch a task from the API', () async {
      when(mockApiService.fetchTasks()).thenAnswer(
        (_) async => [
          Task(
            id: 1,
            name: 'Mock Task 1',
            description: 'This is a mock task',
            dueDate: DateTime.now().getEndOfDay(),
            priority: 1,
          ),
        ],
      );

      await taskProvider.loadTasks();

      expect(taskProvider.tasks.isNotEmpty, true);
      expect(taskProvider.tasks.length, 1);
      expect(taskProvider.tasks[0].id, 1);
    });
    test('Fetch multiple tasks from the API', () async {
      when(mockApiService.fetchTasks()).thenAnswer(
        (_) async => [
          Task(
            id: 1,
            name: 'Mock Task 1',
            description: 'This is a mock task',
            dueDate: DateTime.now().getEndOfDay(),
            priority: 1,
          ),
          Task(
            id: 2,
            name: 'Mock Task 2',
            description: 'This is another mock task',
            dueDate: DateTime.now().add(const Duration(days: 2)),
            priority: 1,
          ),
        ],
      );

      await taskProvider.loadTasks();

      expect(taskProvider.tasks.isNotEmpty, true);
      expect(taskProvider.tasks.length, 2);
      expect(taskProvider.tasks[0].id, 1);
      expect(taskProvider.tasks[1].id, 2);
      expect(taskProvider.tasks[0].name, 'Mock Task 1');
      expect(taskProvider.tasks[1].name, 'Mock Task 2');
    });
  });
}
