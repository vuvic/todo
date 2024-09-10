import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/services/auth_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([SharedPreferences])
import 'auth_service_test.mocks.dart';

void main() {
  late AuthService authService;

  setUp(() {
    // Set mock initial values for SharedPreferences
    SharedPreferences.setMockInitialValues({});
    authService = AuthService();
  });

  group('AuthService', () {
    test('saveLoginStatus should save the login status', () async {
      // Call the method to save the login status
      await authService.saveLoginStatus(true);

      // Retrieve the SharedPreferences instance and check if the value was stored
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isLoggedIn'), true);
    });

    test('checkLoginStatus should return the correct status', () async {
      // Set an initial value for isLoggedIn in SharedPreferences
      SharedPreferences.setMockInitialValues({'isLoggedIn': true});

      final bool isLoggedIn = await authService.checkLoginStatus();

      // Check if the returned value matches the mock value
      expect(isLoggedIn, true);
    });

    test('checkLoginStatus should return false if the key is not found',
        () async {
      // Ensure no initial value is set
      SharedPreferences.setMockInitialValues({});

      final bool isLoggedIn = await authService.checkLoginStatus();

      // The default behavior should return false if no value is found
      expect(isLoggedIn, false);
    });

    test('logout should remove the login status', () async {
      // Set an initial value for isLoggedIn
      SharedPreferences.setMockInitialValues({'isLoggedIn': true});

      // Call the logout method
      await authService.logout();

      // Verify that the key is removed
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('isLoggedIn'), null);
    });
  });
}
