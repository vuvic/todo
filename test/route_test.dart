import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/routes.dart';
import 'package:todo/features/home_page.dart';
import 'package:todo/features/login_page.dart';
import 'package:todo/features/upcoming_tasks_page.dart';
import 'package:todo/features/not_found_page.dart';

void main() {
  Widget createApp() {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }

  testWidgets(
    'Initial route should display HomePage',
    (WidgetTester tester) async {
      await tester.pumpWidget(createApp());
      expect(find.byType(HomePage), findsOneWidget);
    },
  );

  testWidgets(
    'Navigating to /login should display LoginPage',
    (WidgetTester tester) async {
      await tester.pumpWidget(createApp());
      // Simulate navigation to /login
      Navigator.pushNamed(
          tester.element(find.byType(HomePage)), AppRoutes.login);
      await tester.pumpAndSettle(); // Wait for navigation to complete
      expect(find.byType(LoginPage), findsOneWidget);
    },
  );

  testWidgets(
    'Navigating to /upcoming_tasks should display UpcomingTasksPage',
    (WidgetTester tester) async {
      await tester.pumpWidget(createApp());
      // Simulate navigation to /upcoming_tasks
      Navigator.pushNamed(
          tester.element(find.byType(HomePage)), AppRoutes.upcomingTasks);
      await tester.pumpAndSettle(); // Wait for navigation to complete
      expect(find.byType(UpcomingTasksPage), findsOneWidget);
    },
  );

  testWidgets(
    'Navigating to an unknown route should display NotFoundPage',
    (WidgetTester tester) async {
      await tester.pumpWidget(createApp());
      // Simulate navigation to an unknown route
      Navigator.pushNamed(
          tester.element(find.byType(HomePage)), '/unknown_route');
      await tester.pumpAndSettle(); // Wait for navigation to complete
      expect(find.byType(NotFoundPage), findsOneWidget);
    },
  );
}
