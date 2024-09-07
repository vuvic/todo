import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/project.dart';

void main() {
  group(
    'Project Tests',
    () {
      late Project project;
      late Task task1;
      late Task task2;
      setUp(() {
        project = Project(name: 'Project 1', id: 0);
        task1 = Task(
          id: 1,
          name: 'Mock Task 1',
          description: 'This is a mock task',
          dueDate: DateTime.now(),
          priority: 1,
        );
        task2 = Task(
          id: 2,
          name: 'Mock Task 2',
          description: 'This is another mock task',
          dueDate: DateTime.now().add(const Duration(days: 2)),
          priority: 1,
        );
      });

      test('Initialize a project', () {
        expect(project.id, 0);
        expect(project.name, 'Project 1');
        expect(project.tasks.isEmpty, true);
        expect(project.children.isEmpty, true);
      });

      test('Change project name', () {
        project.name = 'Not Project 1';

        expect(project.name, 'Not Project 1');
      });

      test('Change Project name to empty string', () {
        expect(() => project.name = '', throwsA(isA<ArgumentError>()));
      });

      test('Add task', () {
        project.addTask(task1);

        expect(project.tasks[0], task1);
      });

      test('Add multiple tasks', () {
        project.addTask(task1);
        project.addTask(task2);

        expect(project.tasks[0], task1);
        expect(project.tasks[1], task2);
      });

      test('Remove a task', () {
        project.addTask(task1);
        project.addTask(task2);

        project.removeTaskById(task1.id!);
        expect(project.tasks.length, 1);
      });

      test('Remove multiple tasks', () {
        project.addTask(task1);
        project.addTask(task2);

        project.removeTaskById(task1.id!);
        project.removeTaskById(task2.id!);
        expect(project.tasks.length, 0);
      });
    },
  );
}
