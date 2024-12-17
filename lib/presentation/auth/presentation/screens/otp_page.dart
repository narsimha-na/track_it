import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
      decoration: const BoxDecoration(
        color: CustomColors.blueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Otp',
            style: TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: 32,
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Please enter the OTP sent to your email/phone number',
            style: TextStyle(
              fontFamily: FontFamily.zk,
              fontSize: 14,
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 36),
          Pinput(
            validator: (s) {
              return s == '2222' ? null : 'You have entered a wrong OTP';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            defaultPinTheme: PinTheme(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.whiteColor.withOpacity(0.9),
              ),
              textStyle: TextStyle(
                color: CustomColors.blackColor,
                fontFamily: FontFamily.poppins,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            // focusedPinTheme: PinTheme(
            //   padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: CustomColors.whiteColor.withOpacity(0.9),
            //   ),
            //   textStyle: TextStyle(
            //     color: CustomColors.blackColor,
            //     fontFamily: FontFamily.poppins,
            //     fontSize: 16,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            // followingPinTheme: PinTheme(
            //   padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: CustomColors.whiteColor.withOpacity(0.9),
            //   ),
            //   textStyle: TextStyle(
            //     color: CustomColors.blackColor,
            //     fontFamily: FontFamily.poppins,
            //     fontSize: 16,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),

            showCursor: true,
            keyboardType: TextInputType.number,
            errorTextStyle: TextStyle(
              fontFamily: FontFamily.zk,
              fontSize: 16,
              color: CustomColors.orangeColor,
              fontWeight: FontWeight.w500,
            ),
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(height: 36),
          PrimaryButton(
            isWhite: true,
            onPressed: () {},
            label: "Login (via OTP)",
          ),
        ],
      ),
    );
  }
}
