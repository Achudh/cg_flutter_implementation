import 'package:cg_flutter_implementation/features/home/data/entities/contacts.dart';
import 'package:test/test.dart';

void main() {
  group('Contact', () {
    test('default constructor', () {
      // Arrange
      final contact = Contact.initial();

      // Act & Assert
      expect(contact.id, '');
      expect(contact.name, '');
      expect(contact.email, '');
    });

    test('constructor with provided values', () {
      // Arrange
      const contact = Contact(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
      );

      // Act & Assert
      expect(contact.id, '1');
      expect(contact.name, 'John Doe');
      expect(contact.email, 'john.doe@example.com');
    });

    test('fromJson', () {
      // Arrange
      final Map<String, dynamic> json = {
        'id': '2',
        'name': 'Jane Smith',
        'email': 'jane.smith@example.com',
      };

      // Act
      final contact = Contact.fromJson(json);

      // Assert
      expect(contact.id, '2');
      expect(contact.name, 'Jane Smith');
      expect(contact.email, 'jane.smith@example.com');
    });

    test('toJson', () {
      // Arrange
      const contact = Contact(
        id: '3',
        name: 'Alice Johnson',
        email: 'alice.johnson@example.com',
      );

      // Act
      final json = contact.toJson();

      // Assert
      expect(json['id'], '3');
      expect(json['name'], 'Alice Johnson');
      expect(json['email'], 'alice.johnson@example.com');
    });

    test('copyWith', () {
      // Arrange
      const contact = Contact(
        id: '4',
        name: 'Bob Brown',
        email: 'bob.brown@example.com',
      );

      // Act
      final updatedContact = contact.copyWith(name: 'Bob Smith');

      // Assert
      expect(updatedContact.id, '4');
      expect(updatedContact.name, 'Bob Smith');
      expect(updatedContact.email, 'bob.brown@example.com');
    });
  });
}
