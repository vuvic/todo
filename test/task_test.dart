import 'package:flutter_test/flutter_test.dart';
import 'package:todo/core/models/task.dart';
import 'package:todo/shared/utils/date_time_extensions.dart';

void main() {
  group(
    'Task Creation With Non-null Values',
    () {
      late Task task1;

      setUp(() {
        task1 = Task(
          id: 1,
          name: 'Mock Task 1',
          description: 'This is a mock task',
          dueDate: DateTime.now().getEndOfDay(),
          priority: 1,
        );
      });

      test('should have correct id', () {
        expect(task1.id, 1);
      });

      test('should have correct name', () {
        expect(task1.name, 'Mock Task 1');
      });

      test('should have correct description', () {
        expect(task1.description, 'This is a mock task');
      });

      test('should have correct dueDate', () {
        final now = DateTime.now();
        final expectedDate = now.getEndOfDay();
        final dueDate = task1.dueDate;
        if (dueDate != null) {
          expect(dueDate.isAtSameMomentAs(expectedDate), isTrue);
        } else {
          fail('dueDate should not be null');
        }
      });

      test('should have correct priority', () {
        expect(task1.priority, 1);
      });

      test('should initialize with isComplete = false', () {
        expect(task1.isComplete, false);
      });

      test("should have a default description of empty string", () {
        final Task emptyDescriptionTask = Task(
          name: "emptyDescriptionTask",
          id: 1,
          dueDate: DateTime.now().getEndOfDay(),
          priority: 1,
        );

        expect(emptyDescriptionTask.description, "");
      });

      test("should have a default priority of 0", () {
        final Task noPriorityPassed = Task(
          name: "noPriorityPassed",
          id: 1,
          dueDate: DateTime.now().getEndOfDay(),
          description: 'This is a mock task',
        );

        expect(noPriorityPassed.priority, 0);
      });

      test('should be able to initialize with a due date of null', () {
        final Task noDueDate = Task(
          name: "noDueDate",
          id: 1,
          description: 'This is a mock task',
          priority: 1,
        );

        expect(noDueDate.dueDate, null);
      });
    },
  );

  group('Task creation errors', () {
    test('should throw ArgumentError for past due date', () {
      expect(
        () => Task(
          id: 1,
          name: 'Invalid Task',
          dueDate: DateTime.now().subtract(const Duration(days: 1)),
        ),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
            'Due date must be after the current time')),
      );
    });

    test('should throw ArgumentError for a priority below the valid range', () {
      expect(
        () => Task(
          id: 1,
          name: 'Invalid Task',
          priority: -1,
        ),
        throwsA(isA<ArgumentError>().having(
            (e) => e.message, 'message', 'Priority must be between 0 and 5')),
      );
    });

    test('should throw ArgumentError for a priority above the valid range', () {
      expect(
        () => Task(
          id: 1,
          name: 'Invalid Task',
          priority: 6,
        ),
        throwsA(isA<ArgumentError>().having(
            (e) => e.message, 'message', 'Priority must be between 0 and 5')),
      );
    });
  });
}
