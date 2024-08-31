import 'task.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        id: 1,
        name: 'Send SMP World to Vincent',
        description: 'Ensure all details are finalized',
        dueDate: DateTime(2024, 8, 29),
        priority: 1),
    Task(
        id: 2,
        name: 'Pay Tuition',
        description: 'Deadline for fall semester',
        dueDate: DateTime(2024, 8, 29),
        priority: 2),
    Task(
        id: 3,
        name: 'Vocab Reviews',
        description: 'Review 80 words or clear due',
        dueDate: DateTime(2024, 8, 29),
        priority: 3),
    Task(
        id: 4,
        name: 'Review Lecture',
        description: 'Prepare for the upcoming quiz',
        dueDate: DateTime(2024, 8, 30),
        priority: 4),
    Task(
        id: 5,
        name: 'Review Slides for Lecture 1',
        description: 'Get ready for the next class',
        dueDate: DateTime(2024, 8, 31),
        priority: 5),
    Task(
        id: 6,
        name: 'Finish Project Report',
        description: 'Complete the final draft',
        dueDate: DateTime(2024, 9, 1),
        priority: 1),
    Task(
        id: 7,
        name: 'Team Meeting',
        description: 'Discuss project milestones',
        dueDate: DateTime(2024, 9, 2),
        priority: 2),
    Task(
        id: 8,
        name: 'Grocery Shopping',
        description: 'Buy ingredients for the week',
        dueDate: DateTime(2024, 9, 3),
        priority: 3),
    Task(
        id: 9,
        name: 'Doctor\'s Appointment',
        description: 'Annual check-up',
        dueDate: DateTime(2024, 9, 4),
        priority: 4),
    Task(
        id: 10,
        name: 'Update LinkedIn Profile',
        description: 'Reflect recent accomplishments',
        dueDate: DateTime(2024, 9, 5),
        priority: 5),
    Task(
        id: 11,
        name: 'Finish Reading Book',
        description: 'Complete the last two chapters',
        dueDate: DateTime(2024, 9, 6),
        priority: 1),
    Task(
        id: 12,
        name: 'Plan Weekend Getaway',
        description: 'Book hotels and activities',
        dueDate: DateTime(2024, 9, 7),
        priority: 2),
    Task(
        id: 13,
        name: 'Complete Coding Challenge',
        description: 'Submit the solution by deadline',
        dueDate: DateTime(2024, 9, 8),
        priority: 3),
    Task(
        id: 14,
        name: 'Prepare Presentation',
        description: 'For the client meeting',
        dueDate: DateTime(2024, 9, 9),
        priority: 4),
    Task(
        id: 15,
        name: 'Exercise Routine',
        description: 'Complete the weekly workout plan',
        dueDate: DateTime(2024, 9, 10),
        priority: 5),
    Task(
        id: 16,
        name: 'Clean the House',
        description: 'Deep clean before the guests arrive',
        dueDate: DateTime(2024, 9, 11),
        priority: 1),
    Task(
        id: 17,
        name: 'Prepare Dinner Party',
        description: 'Plan menu and shopping list',
        dueDate: DateTime(2024, 9, 12),
        priority: 2),
    Task(
        id: 18,
        name: 'Watch Tutorial on Flutter',
        description: 'Learn about state management',
        dueDate: DateTime(2024, 9, 13),
        priority: 3),
    Task(
        id: 19,
        name: 'Write Blog Post',
        description: 'Share thoughts on recent project',
        dueDate: DateTime(2024, 9, 14),
        priority: 4),
    Task(
        id: 20,
        name: 'Update Resume',
        description: 'Include recent achievements',
        dueDate: DateTime(2024, 9, 15),
        priority: 5),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(int index, Task task) {
    _tasks[index] = task;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
