import 'package:cg_flutter_implementation/core/utils/input_validator.dart';
import 'package:cg_flutter_implementation/features/auth/domain/entities/login_state.dart';
import 'package:cg_flutter_implementation/features/auth/presentation/pages/login_page.dart';
import 'package:cg_flutter_implementation/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginStateNotifier extends Mock implements StateNotifier<LoginState> {
  LoginState update(LoginState state) {
    return state.copyWith();
  }
}

class MockInputValidator extends Mock implements InputValidator {
  static String? validatePassword(String value) {
    return InputValidator.validatePassword(value);
  }
}

void main() {
  testWidgets('LoginPage displays initial state', (WidgetTester tester) async {
    // Wrap the widget with ProviderScope
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          Provider(
            (ref) => MockLoginStateNotifier,
          ),
        ],
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );
    // Find UI elements
    final usernameField = find.byKey(const Key('Username'));
    final passwordField = find.byKey(const Key('Password'));
    final loginButton = find.byKey(const Key('Login'));

    // Assert initial state
    expect(
      find.text('Welcome to Flutter'),
      findsOneWidget,
    );
    expect(
      find.text('Please enter your details to continue'),
      findsOneWidget,
    );
    expect(
      usernameField,
      findsOneWidget,
    );
    expect(
      passwordField,
      findsOneWidget,
    );
    expect(
      tester.widget<TextFormField>(usernameField).initialValue,
      '',
    );
    expect(
      tester.widget<TextFormField>(passwordField).initialValue,
      '',
    );
    expect(
      find.byType(CircularProgressIndicator),
      findsNothing,
    );
    expect(
      loginButton,
      findsOneWidget,
    );
    expect(
      find.text('Forgot Password?'),
      findsOneWidget,
    );
    expect(
      find.text('Error message'),
      findsNothing,
    );
  });
  testWidgets(
    'Username TextFormField updates state on valid input',
    (WidgetTester tester) async {
      // Create a ProviderContainer with initial state
      final container = ProviderContainer(overrides: [
        Provider((ref) => MockLoginStateNotifier),
        Provider((ref) => MockInputValidator()), // Mock the validator
      ]);

      // Wrap the widget with ProviderScope
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            Provider(
              (ref) => MockLoginStateNotifier,
            ),
          ],
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      final updateFunction = container.read(loginStateProvider.notifier).update;
      updateFunction((state) => state.copyWith(username: 'test_user'));

      // Assert that the username in the state is updated after the mock update
      final state = container.read(loginStateProvider);
      expect(state.username, 'test_user');
    },
  );
  testWidgets(
    'Password TextFormField updates state on valid input',
    (WidgetTester tester) async {
      // Create a ProviderContainer with initial state
      final container = ProviderContainer(overrides: [
        Provider((ref) => MockLoginStateNotifier),
        Provider((ref) => MockInputValidator()), // Mock the validator
      ]);
      // Wrap the widget with ProviderScope
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            Provider(
              (ref) => MockLoginStateNotifier,
            ),
          ],
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      final updateFunction = container.read(loginStateProvider.notifier).update;
      updateFunction((state) => state.copyWith(password: 'secure_password'));

      // Assert that the username in the state is updated after the mock update
      final state = container.read(loginStateProvider);
      expect(state.password, 'secure_password');

      //   final usernameField = find.byKey(const Key('Username'));
      final passwordField = find.byKey(const Key('Password'));

      // Enter the sample password
      await tester.enterText(passwordField, 'your_sample_password');

      // Assert no error message displayed (assuming error is displayed on validation failure)
      expect(find.text('Error message'), findsNothing);
    },
  );
}
