import "dart:convert";
import "dart:developer";

import "package:cg_flutter_implementation/features/home/domain/entities/contacts.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:http/http.dart" as http;

class ContactsRepository {
  static const String baseUrl =
      "https://vtahoxgswvfwpdxpkoyn.hasura.ap-south-1.nhost.run/api/rest/cg-flutter-contacts";

  Future<List<Contact>> getContacts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["cg_flutter_contacts"];
      List<Contact> contactList = [];
      data.map(
        (contactJson) {
          contactList.add(Contact.fromJson(
            contactJson,
          ));
        },
      ).toList();
      log("contactsdata.runtimeType.toString() ${contactList.runtimeType.toString()}");
      return contactList;
    } else {
      throw Exception(
        "Failed to fetch contacts. Status code: ${response.statusCode}",
      );
    }
  }
}

final contactsRepositoryProvider =
    Provider<ContactsRepository>((ref) => ContactsRepository());
