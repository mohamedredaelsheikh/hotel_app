// Password validation function
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }
  return null;
}
