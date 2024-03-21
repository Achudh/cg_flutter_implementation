import 'dart:developer';

import 'package:cg_flutter_implementation/core/utils/search_util.dart';
import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:cg_flutter_implementation/features/home/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(filteredContactsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    return contacts.when(
      data: (data) {
        log(data.toString());
        List<Contact> con = data.map((e) => e).toList();
        if (con.isEmpty && searchQuery.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (con.isEmpty) {
          return const Center(child: Text('No contact found'));
        }
        return ListView.builder(
          itemCount: con.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final contact = con[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5,
              ),
              child: Material(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade700,
                        ),
                        children: [
                          highlightText(contact.name, searchQuery, true)
                        ],
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                        children: [
                          highlightText(contact.email, searchQuery, false)
                        ],
                      ),
                    ),
                    leading: Material(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: const Color(
                            0xFFFFADAE,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            contact.name[0] + contact.name.split(' ').last[0],
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        log('Error occured: $error', error: error, stackTrace: stackTrace);
        return const Center(
          child: Text('Error'),
        );
      },
      loading: () {
        log('Loading');
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
