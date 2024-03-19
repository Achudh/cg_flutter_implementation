import "package:cg_flutter_implementation/features/home/domain/entities/contacts.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "contacts_list.freezed.dart";
part "contacts_list.g.dart";

@Freezed(
  copyWith: true,
  fromJson: true,
  toJson: true,
)
class Contacts with _$Contacts {
  const factory Contacts({
    required List<Contact> contacts,
  }) = _Contacts;

  factory Contacts.initial() => const Contacts(
        contacts: [
          Contact(id: "", name: "", email: ""),
        ],
      );
  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$$ContactsImplFromJson(json);
}
