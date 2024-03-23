import 'package:cg_flutter_implementation/features/home/presentation/pages/contacts.dart';
import 'package:cg_flutter_implementation/features/home/presentation/providers/providers.dart';
import 'package:cg_flutter_implementation/features/home/presentation/widgets/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Contacts widget builds with SearchBar and ContactsList',
      (WidgetTester tester) async {
    const screenSize = Size(1080, 1920);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          Provider((ref) => searchQueryProvider.notifier),
        ],
        child: const MediaQuery(
          data: MediaQueryData(size: screenSize),
          child: MaterialApp(
            home: Contacts(),
          ),
        ),
      ),
    );

    final searchBar = find.byType(SearchBar);
    final contactsList = find.byType(ContactsList);

    expect(searchBar, findsOneWidget);
    expect(contactsList, findsOneWidget);
  });
}
