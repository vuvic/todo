import '../models/task.dart'; // Import Task model
import '../services/task_api_service.dart'; // Import TaskApiService
import 'work_item_provider.dart'; // Import WorkItemProvider

class TaskProvider extends WorkItemProvider<Task> {
  TaskProvider(TaskApiService super.apiService);
  List<Task> get tasks => List.unmodifiable(items);
}
