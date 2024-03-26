import 'package:cg_flutter_implementation/features/home/presentation/providers/providers.dart';
import 'package:cg_flutter_implementation/features/home/presentation/widgets/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Contacts extends ConsumerWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQueryNotifier = ref.read(searchQueryProvider.notifier);

    TextEditingController searchTextEditingContoller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size(
            double.maxFinite,
            50,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20,
            ),
            child: SearchBar(
              controller: searchTextEditingContoller,
              onChanged: (value) => searchQueryNotifier.update(
                (state) => value,
              ),
              elevation: const MaterialStatePropertyAll(
                0,
              ),
              hintText: 'Search...',
              leading: const Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
              trailing: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                    onPressed: () {
                      searchTextEditingContoller.clear();
                      searchQueryNotifier.update((state) => '');
                    },
                    icon: Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),
                )
              ],
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
              ),
              hintStyle: const MaterialStatePropertyAll(
                TextStyle(
                  color: Colors.grey,
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                Color(0xFFE8F4F6),
              ),
              shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: const ContactsList(),
    );
  }
}
