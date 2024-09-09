import 'package:flutter/material.dart';
import '../../core/models/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color.fromARGB(255, 140, 84, 150),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: widget.task.isComplete,
              onChanged: (bool? value) {
                setState(() {
                  widget.task.isComplete = value ?? false;
                });
              },
            ),
            Expanded(
              child: Text(
                widget.task.name,
                style: TextStyle(
                  color: Colors.white,
                  decoration: widget.task.isComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
