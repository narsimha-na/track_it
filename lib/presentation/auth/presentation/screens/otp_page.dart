import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:track_it/core/cosntants.dart';
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
      child: Column(
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
            'Enter Otp',
            style: TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: 32,
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Please enter the OTP sent to your number\n+91\t${widget.user.mobileNumber}',
            style: const TextStyle(
              fontFamily: FontFamily.zk,
              fontSize: 14,
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 36),
          Pinput(
            validator: (s) {
              return s == '2222' ? null : 'You have entered a wrong OTP';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            controller: _otpController,
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
            onChanged: (pin) {
              setState(() {
                pin = pin;
              });
            },
            onCompleted: (pin) => print(pin),
          ),
          const SizedBox(height: 36),
          PrimaryButton(
            isWhite: true,
            onPressed: () {
              context.read<AuthCubit>().verifyOtp(
                    otp: _otpController.text,
                    verificationId: widget.verificationId,
                  );
            },
            label: "Login (via OTP)",
          ),
        ],
      ),
    );
  }
}
