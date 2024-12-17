class SignInRequested {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});

  @override
  String toString() => 'SignInRequested(email: $email, password: $password)';
}
