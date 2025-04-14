class GlobalValid {
  static String? validPassword(value){
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  static String? validEmail(value){
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  static String? validUserName(value){
    if (value == null || value.isEmpty) {
      return 'Please enter a text';
    }
    return null;
  }
  static String? validNumber(value){
    final int? number = int.tryParse(value);
    if (number == null ||number < 0 ) {
      return 'Please enter a valid Number';
    }
    return null;
  }
}