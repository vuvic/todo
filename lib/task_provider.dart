import 'task.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: 1,
      name: 'Complete Flutter Project',
      description: 'Finish the UI for the main screen',
      dueDate: DateTime.now(),
      priority: 1,
    ),
    Task(
      id: 2,
      name: 'Grocery Shopping',
      description: 'Buy ingredients for dinner',
      dueDate: DateTime.now(),
      priority: 2,
    ),
    Task(
      id: 3,
      name: 'Team Meeting',
      description: 'Discuss project roadmap',
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: 1,
    ),
    Task(
      id: 4,
      name: 'Write Blog Post',
      description: 'Share experience with Flutter',
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: 3,
    ),
    Task(
      id: 5,
      name: 'Read a Chapter from Book',
      description: 'Read chapter 5 of "Clean Code"',
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: 2,
    ),
    Task(
      id: 6,
      name: 'Doctor Appointment',
      description: 'Annual check-up',
      dueDate: DateTime.now().add(Duration(days: 2)),
      priority: 1,
    ),
    Task(
      id: 7,
      name: 'Workout Session',
      description: 'Leg day at the gym',
      dueDate: DateTime.now().add(Duration(days: 2)),
      priority: 2,
    ),
    Task(
      id: 8,
      name: 'Submit Assignment',
      description: 'Submit the operating systems assignment',
      dueDate: DateTime.now().add(Duration(days: 3)),
      priority: 1,
    ),
    Task(
      id: 9,
      name: 'Plan Weekend Getaway',
      description: 'Research destinations and book hotels',
      dueDate: DateTime.now().add(Duration(days: 3)),
      priority: 3,
    ),
    Task(
      id: 10,
      name: 'Prepare Presentation',
      description: 'Prepare slides for the team meeting',
      dueDate: DateTime.now().add(Duration(days: 4)),
      priority: 2,
    ),
    Task(
      id: 11,
      name: 'Visit Parents',
      description: 'Spend time with family',
      dueDate: DateTime.now().add(Duration(days: 5)),
      priority: 1,
    ),
    Task(
      id: 12,
      name: 'Clean the House',
      description: 'General cleaning and tidying up',
      dueDate: DateTime.now().add(Duration(days: 5)),
      priority: 2,
    ),
    Task(
      id: 13,
      name: 'Review Lecture Notes',
      description: 'Go over the notes for the last lecture',
      dueDate: DateTime.now().add(Duration(days: 6)),
      priority: 1,
    ),
    Task(
      id: 14,
      name: 'Meal Prep for the Week',
      description: 'Prepare meals and snacks for the upcoming week',
      dueDate: DateTime.now().add(Duration(days: 6)),
      priority: 2,
    ),
    Task(
      id: 15,
      name: 'Finish Reading Book',
      description: 'Finish the last chapters of "Clean Code"',
      dueDate: DateTime.now().add(Duration(days: 6)),
      priority: 3,
    ),
    Task(
      id: 16,
      name: 'Plan Next Week',
      description: 'Plan out tasks and events for the upcoming week',
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 1,
    ),
    Task(
      id: 17,
      name: 'Grocery Shopping for the Week',
      description: 'Restock groceries for the week',
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 2,
    ),
    Task(
      id: 18,
      name: 'Laundry',
      description: 'Wash and fold clothes',
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 3,
    ),
    Task(
      id: 19,
      name: 'Car Maintenance',
      description: 'Get an oil change and tire rotation',
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 1,
    ),
    Task(
      id: 20,
      name: 'Review Investment Portfolio',
      description: 'Analyze performance and make adjustments',
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 3,
    ),
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
