class CustomFirebaseAuthException implements Exception {
  final String code;

  CustomFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case "email-already-in-use":
        return "This email address is already registered! please try a different email address";

      case "invalid-email":
        return "This email is invalid! please try another";

      case "weak-password":
        return "This password is weak! we recommend a stronger one";

      case "user-disabled":
        return "This account / user is disabled or deactivated please contact support";

      case "invalid-password":
        return "Invalid account";
      default:
        return "An unexpected error occured";
    }
  }
}
