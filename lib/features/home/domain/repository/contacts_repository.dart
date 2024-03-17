import "package:cg_flutter_implementation/features/home/domain/entities/contacts.dart";
// import "package:http/http.dart" as http;

class ContactsRepository {
  static const String baseUrl = "https://dummyapi.online/api/social-profiles";

  Future<List<Contact>> getContacts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Contact(
        id: "user00001",
        name: "Robert A/L Francis",
        email: "robert@yahoo.com",
      ),
      const Contact(
        id: "user00002",
        name: "Balu Govindasamy",
        email: "balugov@gmail.com",
      ),
    ];
    // final response = await http.get(Uri.parse(baseUrl));
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body) as List;
    //   return data
    //       .map(
    //         (contactJson) => Contact.fromJson(
    //           contactJson,
    //         ),
    //       )
    //       .toList();
    // } else {
    //   throw Exception(
    //     "Failed to fetch contacts. Status code: ${response.statusCode}",
    //   );
    // }
  }
}
