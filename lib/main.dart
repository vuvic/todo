import 'package:flutter/material.dart';
import 'upcoming_tasks_page.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const Todo(),
    ),
  );
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const UpcomingTasksPage(),
    const Center(child: Text('Pomodoro Timer Page')),
    const Center(child: Text('Calendar Page')),
    const Center(child: Text('Settings Page')),
  ];

  void _onDestinationSelected(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {}, // needs behavior for creating a task
            child: const Icon(Icons.add),
          ),
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onDestinationSelected,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.task_alt),
                    label: Text("Tasks"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.timer),
                    label: Text("Tasks"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.calendar_month),
                    label: Text("Calendar"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text("Settings"),
                  ),
                ],
              ),
            ),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
    );
  }
}
