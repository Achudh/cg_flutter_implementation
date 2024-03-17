import "package:cg_flutter_implementation/features/home/domain/entities/contacts.dart";
import "package:cg_flutter_implementation/features/home/domain/repository/contacts_repository.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final contactsRepositoryProvider = Provider((ref) => ContactsRepository());
final searchQueryProvider = StateProvider<String>((ref) => "");

final contactsProvider = FutureProvider<List<Contact>>((ref) {
  final apiService = ref.read(contactsRepositoryProvider);
  return apiService.getContacts();
});

final filteredContactsProvider = Provider<List<Contact>>((ref) {
  final contacts = ref.watch(contactsProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  // Check if data is available and handle loading/error states
  if (contacts.asData == null) {
    // Handle loading or error states (e.g., display a loading indicator or error message)
    return [];
  }

  if (searchQuery.isEmpty) {
    return contacts.asData!.value; // Use asData for efficiency
  }

  return contacts.asData!.value
      .where((contact) =>
          contact.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          contact.email.toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();
});
