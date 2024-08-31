import 'package:flutter/material.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Tasks Page')),
    const Center(child: Text('Settings Page')),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onDestinationSelected,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                    icon: Icon(Icons.task_alt), label: Text("Tasks")),
                NavigationRailDestination(
                    icon: Icon(Icons.calendar_month), label: Text("Calendar")),
                NavigationRailDestination(
                    icon: Icon(Icons.settings), label: Text("Settings")),
              ],
            ),
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    ));
  }
}
