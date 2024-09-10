import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/login_page.dart';

void main() {
  testWidgets('LoginPage should be properly initialized',
      (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    // Check if LoginPage is rendered
    expect(find.byType(LoginPage), findsOneWidget);

    // You can also add checks for specific widgets or text within the LoginPage
    expect(
        find.text('Sign in with Google'), findsOneWidget); // Example text check
  });
}
