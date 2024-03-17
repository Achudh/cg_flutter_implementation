import "package:freezed_annotation/freezed_annotation.dart";

part "login_state.freezed.dart";

@Freezed()
class LoginState with _$LoginState {
  const factory LoginState({
    required String username,
    required String password,
    required bool isLoading,
    required bool obscurePassword,
    String? error,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        username: "",
        password: "",
        isLoading: false,
        obscurePassword: true,
        error: null,
      );
}
