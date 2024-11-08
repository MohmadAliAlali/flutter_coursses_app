class GlobalValid {
  static String? validEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }
}