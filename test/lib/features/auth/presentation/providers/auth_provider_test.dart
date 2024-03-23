import 'package:cg_flutter_implementation/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  test('Login state provider initializes with default values', () {
    // Create a ProviderContainer for testing
    final container = ProviderContainer();

    // Provide the necessary providers
    container.read(loginStateProvider); // Read to trigger initialization
    var loginState = container.read(loginStateProvider);

    // Access the login state
    loginState = container.read(loginStateProvider);

    // Assert initial state values
    expect(loginState.username, '');
    expect(loginState.password, '');
    expect(loginState.isLoading, false);
    expect(loginState.error, null);
    expect(loginState.obscurePassword, true);
  });

  test('Login state provider updates username', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Update username
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            username: 'test_user',
          ),
        );

    // Assert updated username
    expect(loginState.username, 'test_user');
  });
  test('Login state provider updates password', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Update password
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            password: 'secure_password',
          ),
        );

    // Assert updated password
    expect(loginState.password, 'secure_password');
  });
  test('Login state provider sets loading to true', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Set loading to true
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            isLoading: true,
          ),
        );

    // Assert loading state
    expect(loginState.isLoading, true);
  });

  test('Login state provider sets loading to false', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Set loading to true (initially false)
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            isLoading: true,
          ),
        );

    // Set loading to false
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            isLoading: false,
          ),
        );
    // Assert loading state
    expect(loginState.isLoading, false);
  });
  test('Login state provider sets error', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Set error message
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            error: 'Login failed',
          ),
        );

    // Assert error state
    expect(loginState.error, 'Login failed');
  });

  test('Login state provider clears error', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Set error message
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            error: 'Login failed',
          ),
        );

    // Clear error
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            error: null,
          ),
        );

    // Assert error state is null
    expect(loginState.error, null);
  });

  test('Login state provider toggles password visibility', () {
    final container = ProviderContainer();
    container.read(loginStateProvider);
    var loginState = container.read(loginStateProvider);

    // Assert initial visibility
    expect(loginState.obscurePassword, true);

    // Toggle visibility
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            obscurePassword: false,
          ),
        );

    // Assert visibility toggled
    expect(loginState.obscurePassword, false);

    // Toggle again
    loginState = container
        .read(
          loginStateProvider.notifier,
        )
        .update(
          (state) => state.copyWith(
            obscurePassword: true,
          ),
        );

    // Assert visibility back to true
    expect(loginState.obscurePassword, true);
  });
}
