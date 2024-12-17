import 'package:track_it/presentation/auth/data/models/signin_requested.dart';
import 'package:track_it/presentation/auth/data/models/singup_requested.dart';

abstract class AuthRepo {
  Future<void> login({required SignInRequested signInRequested});
  Future<void> signUp({required SignUpRequested signUpRequested});
}
