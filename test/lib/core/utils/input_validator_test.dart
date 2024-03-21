import 'package:cg_flutter_implementation/core/utils/input_validator.dart';
import 'package:test/test.dart';

void main() {
  group('Test simpleValidation', () {
    test('SimpleValidation to check null or empty', () {
      expect(
        InputValidator.simpleValidation(
          null,
          'null check',
        ),
        'null check cannot be empty',
      );
    });
    test('SimpleValidation to check null or empty when given valid input', () {
      expect(
        InputValidator.simpleValidation(
          'Anc',
          'username',
        ),
        null,
      );
    });
  });
  group('Test validatePhone', () {
    test('validatePhone to check null', () {
      expect(
        InputValidator.validatePhone(
          null,
        ),
        'Phone cannot be empty',
      );
    });
    test('validatePhone to check empty string', () {
      expect(
        InputValidator.validatePhone(
          '',
        ),
        'Phone cannot be empty',
      );
    });
    test('validatePhone to check invalid phone no', () {
      expect(
        InputValidator.validatePhone(
          'Absajs',
        ),
        'Enter a valid phone no.',
      );
    });
    test('validatePhone to check valid 10 digit phone no', () {
      expect(
        InputValidator.validatePhone(
          '12344',
        ),
        'Enter a 10 digit phone number',
      );
    });
    test('validatePhone to check valid phone no', () {
      expect(
        InputValidator.validatePhone(
          '1234567890',
        ),
        null,
      );
    });
  });
  group('Test validatePassword', () {
    test('validatePassword to check null', () {
      expect(
        InputValidator.validatePassword(
          null,
        ),
        'Password cannot be empty',
      );
    });
    test('validatePassword to check empty string', () {
      expect(
        InputValidator.validatePassword(
          '',
        ),
        'Password cannot be empty',
      );
    });
    test('validatePassword to check length of password', () {
      expect(
        InputValidator.validatePassword(
          'Absajs',
        ),
        'Password must be of 8-16 characters length',
      );
    });
    test('validatePassword to check one upper case letter', () {
      expect(
        InputValidator.validatePassword(
          '1234567890',
        ),
        'Atleast one upper case letter [A-Z] is required',
      );
    });
    test('validatePassword to check one lower letter', () {
      expect(
        InputValidator.validatePassword(
          'A234567890',
        ),
        'Atleast one lower letter [a-z] is required',
      );
    });
    test('validatePassword to check special character', () {
      expect(
        InputValidator.validatePassword(
          'A2a34567890',
        ),
        'Atleast one special character [!@#%] is required',
      );
    });
    test('validatePassword to check password length more than 16', () {
      expect(
        InputValidator.validatePassword('A2a345!1322Ad343uh5hu2!!@#'),
        'Password must be of 8-16 characters length',
      );
    });
    test('validatePassword to check at least one digit', () {
      expect(
        InputValidator.validatePassword('TestTest!'),
        'Atleast one digit [0-9] is required',
      );
    });
    test('validatePassword to check password length more than 16', () {
      expect(
        InputValidator.validatePassword('Test123!'),
        null,
      );
    });
  });
  group('Test validateEmail', () {
    test('validateEmail to check null', () {
      expect(
        InputValidator.validateEmail(
          null,
        ),
        'Email cannot be empty',
      );
    });
    test('validateEmail to check empty string', () {
      expect(
        InputValidator.validateEmail(
          '',
        ),
        'Email cannot be empty',
      );
    });

    test('validateEmail to check invalid email', () {
      expect(
        InputValidator.validateEmail('abc'),
        'Enter a valid email',
      );
    });
    test('validateEmail to check valid email', () {
      expect(
        InputValidator.validateEmail('abc@a.com'),
        null,
      );
    });
  });
}
