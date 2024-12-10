import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/widgets/bottomsheets.dart';
import 'package:track_it/presentation/auth/widgets/gender_widget.dart';
import 'package:track_it/presentation/auth/widgets/text_feilds.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController currentWCtrl = TextEditingController();
  TextEditingController targetWCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      bgColor: CustomColors.blueColor,
      childWidget: Padding(
        padding: const EdgeInsets.fromLTRB(24, 52, 24, 42),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 26,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: const BackB(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: FontFamily.zk,
                    fontSize: 32,
                    color: CustomColors.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthTextFeilds(
                    ctrl: nameCtrl,
                    firstName: 'Ema',
                    secondName: 'il :',
                    measuringUnit: ""),
                const SizedBox(
                  height: 8,
                ),
                AuthTextFeilds(
                    ctrl: nameCtrl,
                    isPassword: true,
                    firstName: 'Pass',
                    secondName: 'word:',
                    measuringUnit: ""),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(RouterConstants.loginPage);
                    },
                    child: Text(
                      'Forgot Password ',
                      style: TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: CustomColors.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(RouterConstants.loginPage);
                    },
                    child: Text(
                      'Don\'t have a account ? click here to Sing Up',
                      style: TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: CustomColors.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      isWhite: true,
                      onPressed: () {
                        context.goNamed(
                          RouterConstants.loginPage,
                        );
                      },
                      label: "Login ",
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: PrimaryButton(
                      isWhite: true,
                      onPressed: () {
                        AuthBottomsheets.otpBottomSheet(context);
                      },
                      label: "Login (via OTP)",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
