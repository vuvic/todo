import 'package:flutter/material.dart';
import '../features/upcoming_tasks_page.dart';
import '../features/login_page.dart';
import '../features/home_page.dart';
import '../features//not_found_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String upcomingTasks = '/upcoming_tasks';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'upcoming_tasks':
        return MaterialPageRoute(builder: (_) => const UpcomingTasksPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(
            builder: (_) => NotFoundPage()); // Handle unknown routes
    }
  }
}
