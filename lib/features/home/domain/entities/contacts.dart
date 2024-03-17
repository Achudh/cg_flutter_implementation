import "package:freezed_annotation/freezed_annotation.dart";

part "contacts.freezed.dart";
part "contacts.g.dart";

@Freezed(
  copyWith: true,
  fromJson: true,
  toJson: true,
)
class Contact with _$Contact {
  const factory Contact({
    required String id,
    required String name,
    required String email,
  }) = _Contact;

  factory Contact.initial() => const Contact(id: "", name: "", email: "");
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);
}
