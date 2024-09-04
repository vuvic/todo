// Import necessary packages
import 'package:mockito/annotations.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/services/task_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/task.dart';
import 'package:mockito/mockito.dart';

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

    test('should fetch tasks from the API', () async {
      when(mockApiService.fetchTasks()).thenAnswer(
        (_) async => [
          Task(
            id: 1,
            name: 'Mock Task 1',
            description: 'This is a mock task',
            dueDate: DateTime.now(),
            priority: 1,
            isComplete: false,
          ),
        ],
      );

      await taskProvider.loadTasks();

      expect(taskProvider.tasks.isNotEmpty, true);
      expect(taskProvider.tasks.length, 1);
      expect(taskProvider.tasks.first.name, 'Mock Task 1');
    });
  });
}
