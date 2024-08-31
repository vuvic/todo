import 'package:flutter/material.dart';
import 'task_card.dart';
import 'task.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class UpcomingTasksPage extends StatelessWidget {
  const UpcomingTasksPage({super.key});
  final int daysInWeek = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Tasks"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double minListViewWidth = 300.0;
          int numberOfColumns =
              (constraints.maxWidth / minListViewWidth).floor();
          numberOfColumns =
              numberOfColumns > daysInWeek ? daysInWeek : numberOfColumns;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: List.generate(
                numberOfColumns,
                (index) {
                  return TasksForDateColumn(index: index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// A single column in upcoming_tasks_page
class TasksForDateColumn extends StatefulWidget {
  final int index;

  const TasksForDateColumn({
    super.key,
    required this.index,
  });

  @override
  State<TasksForDateColumn> createState() => _TasksForDateColumnState();
}

class _TasksForDateColumnState extends State<TasksForDateColumn> {
  late DateTime columnDate;
  late String dayName;
  late String formattedColumnDateStr;
  late List<Task> tasksForDate; // need to calculate somehow

  List<Task> _getTasksForDate(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return taskProvider.tasks.where((task) {
      return task.dueDate?.year == columnDate.year &&
          task.dueDate?.month == columnDate.month &&
          task.dueDate?.day == columnDate.day;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    columnDate = DateTime.now().add(Duration(days: widget.index));
    dayName = _getDayName(columnDate);
    formattedColumnDateStr = "$dayName (${columnDate.month}/${columnDate.day})";
    tasksForDate = _getTasksForDate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(formattedColumnDateStr),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tasksForDate.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TaskCard(task: tasksForDate[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _getDayName(DateTime date) {
  const List<String> dayNames = [
    'Monday', // 1
    'Tuesday', // 2
    'Wednesday', // 3
    'Thursday', // 4
    'Friday', // 5
    'Saturday', // 6
    'Sunday', // 7
  ];
  return dayNames[date.weekday - 1];
}
