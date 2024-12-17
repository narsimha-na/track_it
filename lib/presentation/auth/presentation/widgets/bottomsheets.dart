import 'package:flutter/material.dart';
import 'package:track_it/presentation/auth/presentation/screens/otp_page.dart';

class AuthBottomsheets {
  static otpBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => OtpPage(),
    );
  }
}
