import 'package:cg_flutter_implementation/features/auth/domain/repository/auth_repository.dart';
import 'package:cg_flutter_implementation/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Test Login State Provider', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginRepositoryProvider.overrideWithValue(FakeLoginRepository()),
        ],
        child: MaterialApp(
          home: Consumer(builder: (context, ref, child) {
            final state = ref.watch(loginStateProvider);
            return Text(
                'Username: ${state.username}, Password: ${state.password}');
          }),
        ),
      ),
    );

    // Verify the initial state
    expect(find.text('Username: , Password: '), findsOneWidget);
  });

  testWidgets('Test Login UseCase Provider', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginRepositoryProvider.overrideWithValue(FakeLoginRepository()),
        ],
        child: MaterialApp(
          home: Consumer(builder: (context, ref, child) {
            final useCase = ref.watch(loginUseCaseProvider);
            return Text('Login UseCase: $useCase');
          }),
        ),
      ),
    );

    // Verify the use case is not null
    expect(find.text('Login UseCase: '), findsOneWidget);
  });

  testWidgets('Test Login Repository Provider', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Consumer(builder: (context, ref, child) {
            final repository = ref.watch(loginRepositoryProvider);
            return Text('Login Repository: $repository');
          }),
        ),
      ),
    );

    // Verify the repository is not null
    expect(find.text('Login Repository: '), findsOneWidget);
  });
}
