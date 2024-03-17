// lib/domain/contacts_usecase.dart

import "package:cg_flutter_implementation/features/home/domain/entities/contacts.dart";

abstract class ContactsUseCase {
  Future<List<Contact>> getContacts();
}
