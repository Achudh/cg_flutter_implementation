import 'package:cg_flutter_implementation/features/auth/domain/entities/login_state.dart';
import 'package:cg_flutter_implementation/features/auth/domain/repository/auth_repository.dart';
import 'package:cg_flutter_implementation/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider = StateProvider<LoginState>(
  (ref) => const LoginState(
    username: '',
    password: '',
    isLoading: false,
    error: null,
    obscurePassword: true,
  ),
);

final loginUseCaseProvider = Provider((ref) => LoginUseCase(
      ref.watch(loginRepositoryProvider),
    ));

final loginRepositoryProvider = Provider((ref) => FakeLoginRepository());
