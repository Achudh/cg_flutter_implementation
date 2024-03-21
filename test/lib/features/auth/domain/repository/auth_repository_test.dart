import 'package:cg_flutter_implementation/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginRepository loginRepository;

  setUp(() {
    loginRepository = FakeLoginRepository();
  });

  group('LoginRepository', () {
    test('Login successful', () async {
      final result = await loginRepository.login('username', 'password');
      expect(result, true);
    });

    test('Logout successful', () async {
      final result = await loginRepository.logOut();
      expect(result, false);
    });
  });
}
