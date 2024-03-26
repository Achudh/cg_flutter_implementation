import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:cg_flutter_implementation/features/home/data/repository/contacts_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final contactsProvider = FutureProvider<List<Contact>>((ref) {
  return ref.watch(contactsRepositoryProvider).getContacts();
});

final filteredContactsProvider = FutureProvider<List<Contact>>((ref) {
  final contacts = ref.watch(contactsProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  if (contacts.hasError) {
    if (kDebugMode) {
      print('contacts.error');
      print(contacts.error);
      print('contacts.stackTrace');
      print(contacts.stackTrace);
    }
  }
  if (contacts.asData == null) {
    return [];
  }
  if (searchQuery.isEmpty) {
    return contacts.asData!.value;
  }

  return contacts.asData!.value
      .where(
        (contact) =>
            contact.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
            contact.email.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
      )
      .toList();
});
