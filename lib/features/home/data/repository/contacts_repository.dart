import 'dart:convert';
import 'dart:developer';

import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ContactsRepository {
  ContactsRepository({
    required this.client,
    required this.baseUrl,
  });
  final http.Client client;
  final String baseUrl;

  Future<List<Contact>> getContacts() async {
    final headers = {'content-type': 'application/json'};
    final response = await client.get(
      Uri.parse(
        baseUrl,
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['cg_flutter_contacts'];
      List<Contact> contactList = [];
      data.map(
        (contactJson) {
          contactList.add(Contact.fromJson(
            contactJson,
          ));
        },
      ).toList();
      log('contactsdata.runtimeType.toString() ${contactList.runtimeType.toString()}');
      return contactList;
    } else {
      throw Exception(
        'Failed to fetch contacts. Status code: ${response.statusCode}',
      );
    }
  }
}

final contactsRepositoryProvider = Provider<ContactsRepository>(
  (ref) => ContactsRepository(
    client: http.Client(),
    baseUrl:
        'https://vtahoxgswvfwpdxpkoyn.hasura.ap-south-1.nhost.run/api/rest/cg-flutter-contacts',
  ),
);
