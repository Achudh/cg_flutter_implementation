import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:cg_flutter_implementation/features/home/data/repository/contacts_repository.dart';
import 'package:cg_flutter_implementation/features/home/domain/use_cases/get_contacts_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_contacts_use_case_test.mocks.dart';

@GenerateMocks([ContactsRepository])
void main() {
  testWidgets('GetContactsUseCase fetches contacts successfully',
      (WidgetTester tester) async {
    final mockContactsRepository = MockContactsRepository();
    // Define a list of expected contacts
    final List<Contact> expectedContacts = [
      const Contact(id: '1', name: 'John Doe', email: 'a@a.com'),
      const Contact(id: '2', name: 'Jane Smith', email: 'a@a.com'),
    ];

    // Stub the getContacts method of the mock repository to return the expected list
    when(mockContactsRepository.getContacts())
        .thenAnswer((_) => Future.value(expectedContacts));

    // Create an instance of GetContactsUseCase with the mock repository
    final useCase = GetContactsUseCase(mockContactsRepository);

    // Call getContacts on the use case
    final contacts = await useCase.getContacts();

    // Assert that the expected contacts are retrieved
    expect(contacts, expectedContacts);
  });
}
