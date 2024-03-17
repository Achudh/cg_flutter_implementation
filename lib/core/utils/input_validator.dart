//ignore_for_file: body_might_complete_normally_nullable
/// [InputValidator] contains [validateEmail] [validatePassword] [validatePhone]
/// [simpleValidation]
class InputValidator {
  /// [validateEmail] takes in a value of String
  /// uses regex of r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "Enter a valid email";
    }
  }

  /// [validatePassword] takes in a value of String
  /// RegExp(r'[A-Z]') Atleast one upper case letter [A-Z] is required
  /// RegExp(r'[0-9]') Atleast one digit [0-9] is required
  /// RegExp(r'[a-z]') Atleast one lower letter [a-z] is required
  /// RegExp(r'[!@#$%^&*(),.?':{}|<>]') Atleast one special character
  /// [!@#%] is required
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 8 || value.length > 16) {
      return "Password must be of 8-16 characters length";
    }
    // ignore: unnecessary_raw_strings
    final bool hasUppercase = value.contains(RegExp(r"[A-Z]"));
    // ignore: unnecessary_raw_strings
    final bool hasDigits = value.contains(RegExp(r"[0-9]"));
    // ignore: unnecessary_raw_strings
    final bool hasLowercase = value.contains(RegExp(r"[a-z]"));
    final bool hasSpecialCharacters =
        value.contains(RegExp(r"[!@#$%^&*(),.?':{}|<>]"));
    //change the error message as required..
    if (!hasUppercase) {
      return "Atleast one upper case letter [A-Z] is required";
    } else if (!hasLowercase) {
      return "Atleast one lower letter [a-z] is required";
    } else if (!hasDigits) {
      return "Atleast one digit [0-9] is required";
    } else if (!hasSpecialCharacters) {
      return "Atleast one special character [!@#%] is required";
    }
    return null;
  }

  /// [validatePhone]
  ///
  /// RegExp(r'[0-9]') Atleast one digit [0-9] is required
  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Phone cannot be empty";
      // ignore: unnecessary_raw_strings
    } else if (!value.contains(RegExp(r"[0-9]"))) {
      return "Enter a valid phone no.";
    } else if (value.length != 10) {
      return "Enter a 10 digit phone number";
    }
    return null;
  }

  /// [simpleValidation]
  /// value - The string to validated,
  /// title - The title which is displayed with the error msg,
  /// e.g if title is name then error msg = 'Name cannot we empty'
  static String? simpleValidation(String? value, String title) {
    if (value == null || value.isEmpty) {
      return "$title cannot be empty";
    }
    return null;
  }
}
