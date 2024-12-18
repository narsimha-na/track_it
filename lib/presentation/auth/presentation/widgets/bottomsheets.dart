import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:track_it/presentation/auth/data/models/user.dart' as userModel;
import 'package:track_it/presentation/auth/presentation/screens/otp_page.dart';

class AuthBottomsheets {
  static otpBottomSheet({
    required BuildContext context,
    required userModel.User user,
    required String verificationId,
  }) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => OtpPage(
        verificationId: verificationId,
        user: user,
      ),
    );
  }
}
