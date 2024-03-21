import 'package:cg_flutter_implementation/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this.repository);
  final LoginRepository repository;

  Future<bool> login(String username, String password) async {
    final isLoggedIn = await repository.login(username, password);
    return isLoggedIn;
  }
}
