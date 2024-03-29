import 'dart:convert';

import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:cg_flutter_implementation/features/home/data/repository/contacts_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'contacts_repository_test.mocks.dart';

// Assuming the mock class is correctly generated after running the build runner
@GenerateMocks([http.Client])
void main() {
  late ContactsRepository contactsRepository;
  late MockClient mockHttpClient; // Use the generated MockClient
  const baseUrl = 'https://example.com';
  final responseBody = {
    'cg_flutter_contacts': [
      {'id': '1', 'name': 'John Doe', 'email': 'john@example.com'},
      {'id': '2', 'name': 'Jane Smith', 'email': 'jane@example.com'}
    ]
  };

  setUp(() {
    mockHttpClient = MockClient();
    when(
      mockHttpClient.get(
        Uri.parse(baseUrl),
        headers: {'content-type': 'application/json'},
      ),
    ).thenAnswer((_) async => http.Response(jsonEncode(responseBody), 200));
    contactsRepository = ContactsRepository(
      client: mockHttpClient,
      baseUrl: baseUrl,
    );
  });

  test('getContacts - success', () async {
    final contacts = await contactsRepository.getContacts();
    expect(contacts, isA<List<Contact>>());
    expect(contacts.length, 2);
    expect(contacts[0].id, '1');
    expect(contacts[0].name, 'John Doe');
    expect(contacts[0].email, 'john@example.com');
    expect(contacts[1].id, '2');
    expect(contacts[1].name, 'Jane Smith');
    expect(contacts[1].email, 'jane@example.com');
  });

  test('getContacts - failure (404 Not Found)', () {
    when(
      mockHttpClient.get(
        Uri.parse(baseUrl),
        headers: {'content-type': 'application/json'},
      ),
    ).thenAnswer((_) async => http.Response('Not Found', 404));
    expect(contactsRepository.getContacts(), throwsException);
  });

  test('getContacts - failure (non-200 status code)', () {
    when(
      mockHttpClient.get(
        Uri.parse(baseUrl),
        headers: {'content-type': 'application/json'},
      ),
    ).thenAnswer((_) async => http.Response('Internal Server Error', 500));
    expect(contactsRepository.getContacts(), throwsException);
  });
}
