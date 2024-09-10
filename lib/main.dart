import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/providers/task_provider.dart';
import 'core/services/task_api_service.dart';
import 'routes.dart';

void main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Error loading .env file: $e");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TaskProvider(
                  TaskApiService(baseUrl: dotenv.env['BASE_URL']!),
                )),
      ],
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
