class AuthErrorModel {
  final String code;
  final String message;

  AuthErrorModel(this.code, this.message);

  static String getMessage(String code) {
    switch (code) {
      case 'user-not-found':
      case 'invalid-credential':
        return "No user found with this email.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'invalid-email':
        return "The email address is not valid.";
      case 'email-not-verified':
        return "Your email is not verified. Please check your email.";
      default:
        return "Login failed. Please try again later.";
    }
  }
}
