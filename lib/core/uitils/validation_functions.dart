/// Checks if string consist only Alphabet. (No Whitespace)
bool isValidText(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if string is email.
bool isValidEmail(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if string is phone number
/// Checks if the phone number is valid based on the given rules.
bool isValidPhoneNumber(String? inputString, {bool isRequired = false}) {
  if (inputString == null || inputString.isEmpty) {
    return !isRequired;
  }

  // Remove any leading and trailing whitespaces
  inputString = inputString.trim();

  // Define regex patterns for the two cases
  const patternStart07or09 = r'^(07|09)\d{8}$';
  const patternStartPlus251 = r'^\+251\d{9}$';

  final regExpStart07or09 = RegExp(patternStart07or09);
  final regExpStartPlus251 = RegExp(patternStartPlus251);

  return regExpStart07or09.hasMatch(inputString) ||
      regExpStartPlus251.hasMatch(inputString);
}

/// Checks if the string is a valid password with at least 6 digits.
bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = !isRequired;
  }

  if (inputString != null && inputString.isNotEmpty) {
    bool hasMinLength = inputString.length >= 6;
    bool containsNumber = inputString.contains(RegExp(r'\d'));
    isInputStringValid = hasMinLength && containsNumber;
  }

  return isInputStringValid;
}

int? isValidEmailOrPhoneNumber(String inputString) {
  final isNumeric = RegExp(r'^\d+$').hasMatch(inputString);

  if (isNumeric) {
    bool isPhoneNumberValid = isValidPhoneNumber(inputString);

    return isPhoneNumberValid ? 1 : 0;
  } else {
    bool isEmailValid = isValidEmail(inputString);

    return isEmailValid ? 2 : 3;
  }
}
