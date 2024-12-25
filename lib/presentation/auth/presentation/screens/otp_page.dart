import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/cubit/auth_cubit.dart';
import 'package:track_it/presentation/auth/data/models/user.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.user,
    required this.verificationId,
  });

  final User user;
  final String verificationId;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  bool isResendOtp = false;
  int timer = 0;
  Timer? timerVal;
  @override
  void initState() {
    super.initState();
    _reSetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
      decoration: const BoxDecoration(
        color: CustomColors.darkBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<AuthCubit, AuthCubitState>(builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 48,
                height: 3,
                margin: const EdgeInsets.only(bottom: 42),
                decoration: const BoxDecoration(
                  color: CustomColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            const Text(
              'Enter your OTP',
              style: TextStyle(
                fontFamily: FontFamily.poppins,
                fontSize: 36,
                color: CustomColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Please enter the OTP sent to your number\n+91\t${widget.user.mobileNumber}',
              style: const TextStyle(
                fontFamily: FontFamily.zk,
                fontSize: 16,
                color: CustomColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 36),
            Pinput(
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              controller: _otpController,
              length: 6,
              defaultPinTheme: PinTheme(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.whiteColor.withOpacity(0.9),
                ),
                textStyle: const TextStyle(
                  color: CustomColors.blackColor,
                  fontFamily: FontFamily.poppins,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              showCursor: true,
              keyboardType: TextInputType.number,
              errorTextStyle: const TextStyle(
                fontFamily: FontFamily.zk,
                fontSize: 16,
                color: CustomColors.orangeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _resendOtp();
                },
                child: Text(
                  isResendOtp ? 'Re-Send OTP' : 'Resend OTP in $timer seconds',
                  style: const TextStyle(
                    fontFamily: FontFamily.zk,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: CustomColors.whiteColor,
                    color: CustomColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {
                      _verifyOtp();
                    },
                    isLoading: state is AuthCubitOtpLoading,
                    label: "Verify OTP",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    buttonColor: CustomColors.orangeColor,
                    textColor: CustomColors.whiteColor,
                    onPressed: () {
                      context.pop();
                    },
                    label: "Cancel",
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  _reSetTimer() {
    timerVal = Timer.periodic(const Duration(seconds: 1), (timerVal) {
      setState(() {
        timer = timerVal.tick;
        if (timer == 31) {
          timerVal.cancel();
          isResendOtp = true;
          timer = 0;
        }
      });
    });
  }

  _resendOtp() {
    if (isResendOtp) {
      try {
        _reSetTimer();
        context.read<AuthCubit>().sentOtp(
              context: context,
              user: widget.user,
            );
      } catch (e) {
        GeneralWidgets.toast(e.toString());
      }
    }
  }

  _verifyOtp() {
    if (_otpController.text.length != 6) {
      GeneralWidgets.toast("Please enter a valid OTP");
    } else {
      context.read<AuthCubit>().verifyOtp(
          otp: _otpController.text,
          verificationId: widget.verificationId,
          user: widget.user);
    }
  }

  @override
  void dispose() {
    super.dispose();
    timerVal!.cancel();
  }
}
