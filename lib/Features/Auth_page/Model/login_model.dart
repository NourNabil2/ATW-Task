class AuthMessageModel {
  final String code;
  final String message;

  AuthMessageModel(this.code, this.message);

  static String getMessage(String code) {
    switch (code) {
    // Error cases
      case 'user-not-found':
      case 'invalid-credential':
        return "No user found with this email.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'invalid-email':
        return "The email address is not valid.";
      case 'email-not-found':
        return "Your email is not found.";
    // Success case
      case 'login-success':
        return "Login successful.";
      default:
        return "An unknown error occurred. Please try again later.";
    }
  }
}
