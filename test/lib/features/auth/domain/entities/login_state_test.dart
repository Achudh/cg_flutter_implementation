import 'package:cg_flutter_implementation/features/auth/domain/entities/login_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginState', () {
    test('Initial state', () {
      final initialState = LoginState.initial();

      expect(initialState.username, '');
      expect(initialState.password, '');
      expect(initialState.isLoading, false);
      expect(initialState.obscurePassword, true);
      expect(initialState.error, isNull);
    });

    test('CopyWith', () {
      final updatedState = LoginState.initial().copyWith(
        username: 'johndoe',
        password: 'password123',
        isLoading: true,
        obscurePassword: false,
        error: 'Invalid credentials',
      );

      expect(updatedState.username, 'johndoe');
      expect(updatedState.password, 'password123');
      expect(updatedState.isLoading, true);
      expect(updatedState.obscurePassword, false);
      expect(updatedState.error, 'Invalid credentials');
    });
  });
}
