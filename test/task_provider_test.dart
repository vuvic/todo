import 'package:mockito/mockito.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/services/task_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/task.dart';

class MockApiService extends Mock implements TaskApiService {}

void main() {
  group('TaskProvider with MockApiService', () {
    late TaskProvider taskProvider;
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      taskProvider = TaskProvider(apiService: mockApiService);
    });

    test('should fetch tasks from the API', () async {
      // Mock the fetchTasks method to return a Future with a list of tasks
      when(mockApiService.fetchTasks()).thenReturn(Future.value([
        Task(
          id: 1,
          name: 'Mock Task 1',
          description: 'This is a mock task',
          dueDate: DateTime.now(),
          priority: 1,
          isComplete: false,
        ),
        Task(
          id: 2,
          name: 'Mock Task 2',
          description: 'This is another mock task',
          dueDate: DateTime.now(),
          priority: 2,
          isComplete: true,
        ),
      ]));

      await taskProvider.loadTasks();

      // Verify that fetchTasks was called
      verify(mockApiService.fetchTasks()).called(1);

      // Verify that the tasks were fetched
      expect(taskProvider.tasks.isNotEmpty, true);
      expect(taskProvider.tasks.length, 2);
    });
  });
}
