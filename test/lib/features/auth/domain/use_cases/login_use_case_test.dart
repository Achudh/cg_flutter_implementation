import 'package:cg_flutter_implementation/features/auth/domain/repository/auth_repository.dart';
import 'package:cg_flutter_implementation/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  group('LoginUseCase', () {
    late LoginUseCase loginUseCase;
    late MockLoginRepository mockLoginRepository;

    setUp(() async {
      mockLoginRepository = MockLoginRepository();
      loginUseCase = LoginUseCase(mockLoginRepository);
    });

    test('login - success', () async {
      // Arrange
      const String username = 'testuser';
      const String password = 'testpassword';
      when(
        mockLoginRepository.login(
          username,
          password,
        ),
      ).thenAnswer((realInvocation) => Future.value(true));

      // Act
      final result = await loginUseCase.login(username, password);

      // Assert
      expect(result, true);
      verify(mockLoginRepository.login(username, password)).called(1);
    });

    test('login - failure', () async {
      // Arrange
      const String username = 'testuser';
      const String password = 'testpassword';
      when(
        mockLoginRepository.login(
          username,
          password,
        ),
      ).thenAnswer((realInvocation) => Future.value(false));

      // Act
      final result = await loginUseCase.login(username, password);

      // Assert
      expect(result, false);
      verify(mockLoginRepository.login(username, password)).called(1);
    });
  });
}
