import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:cg_flutter_implementation/features/home/domain/use_cases/contacts_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_use_case_test.mocks.dart';

@GenerateMocks([ContactsUseCase])
void main() {
  testWidgets('ContactsUseCase fetches contacts successfully',
      (WidgetTester tester) async {
    final mockUseCase = MockContactsUseCase();

    // Define a list of expected contacts
    final List<Contact> expectedContacts = [
      const Contact(id: '1', name: 'John Doe', email: 'a@a.com'),
      const Contact(id: '2', name: 'Jane Smith', email: 'a@a.com'),
    ];

    when(mockUseCase.getContacts())
        .thenAnswer((_) => Future.value(expectedContacts));
  });
}
