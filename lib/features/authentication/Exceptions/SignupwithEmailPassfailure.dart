class SignupWithEmailPassFail {
  final String message;
  SignupWithEmailPassFail([this.message = "An Unknown error Occured"]);

  factory SignupWithEmailPassFail.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignupWithEmailPassFail('Please enter a strong password');
      case 'invalid-email':
        return SignupWithEmailPassFail('Please enter a valid email');
      case 'email already in use':
        return SignupWithEmailPassFail('User already Exists from this mail');
      case 'operation not allowed':
        return SignupWithEmailPassFail(
            'Operation is not valid. Please contact Support');
      case 'user_disabled':
        return SignupWithEmailPassFail(
            'User has been disabled. Please contact Support for help');
      default:
        return SignupWithEmailPassFail();
    }
  }
}
