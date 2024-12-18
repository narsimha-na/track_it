import 'package:flutter/widgets.dart';
import 'package:track_it/presentation/auth/data/models/signin_requested.dart';
import 'package:track_it/presentation/auth/data/models/singup_requested.dart';
import 'package:track_it/presentation/auth/data/models/user.dart';

abstract class AuthRepo {
  Future<void> login({required SignInRequested signInRequested});
  Future<void> signUp({required SignUpRequested signUpRequested});
  Future<bool> verifyOtp({
    required String otp,
    required String verificationId,
  });
  Future<void> sendOtp({
    required String mobileNumber,
    required BuildContext context,
    required User user,
  });
}
