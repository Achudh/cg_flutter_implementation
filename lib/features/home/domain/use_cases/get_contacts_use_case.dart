import "dart:developer";

import "package:cg_flutter_implementation/features/home/domain/entities/contacts.dart";
import "package:cg_flutter_implementation/features/home/domain/repository/contacts_repository.dart";
import "package:cg_flutter_implementation/features/home/domain/use_cases/contacts_use_case.dart";

class GetContactsUseCase implements ContactsUseCase {
  GetContactsUseCase(this.repository);
  final ContactsRepository repository;

  @override
  Future<List<Contact>> getContacts() async {
    try {
      final contacts = await repository.getContacts();
      return contacts;
    } on Exception catch (error) {
      // Handle errors gracefully (e.g., logging, user feedback)
      log("Error fetching contacts: $error");
      throw Exception("Failed to fetch contacts"); // Re-throw for UI handling
    }
  }
}
