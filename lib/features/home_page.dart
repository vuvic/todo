import 'package:flutter/material.dart';
import '../core/services/login_session_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoginSessionService _loginSessionService = LoginSessionService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final bool isLoggedIn = await _loginSessionService.checkLoginStatus();

    if (!mounted) {
      debugPrint('HomePage is no longer mounted. Navigation skipped.');
      return;
    }

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/upcoming_tasks');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
