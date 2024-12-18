import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/cubit/auth_cubit.dart';
import 'package:track_it/presentation/auth/data/models/signin_requested.dart';
import 'package:track_it/presentation/auth/presentation/screens/otp_page.dart';
import 'package:track_it/presentation/auth/presentation/widgets/bottomsheets.dart';
import 'package:track_it/presentation/auth/presentation/widgets/text_feilds.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

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
                    onTap: () {
                      context.pop();
                    },
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
                  ctrl: emailCtrl,
                  firstName: 'Ema',
                  secondName: 'il :',
                  measuringUnit: "",
                ),
                const SizedBox(
                  height: 8,
                ),
                AuthTextFeilds(
                  ctrl: passwordCtrl,
                  isPassword: true,
                  firstName: 'Pass',
                  secondName: 'word:',
                  measuringUnit: "",
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(RouterConstants.loginPage);
                    },
                    child: const Text(
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
                      context.pushNamed(RouterConstants.signUpPage);
                    },
                    child: const Text(
                      'Don\'t have a account ? click here to Sing Up',
                      style: TextStyle(
                        fontFamily: FontFamily.poppins,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: CustomColors.greyColor,
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
              child: BlocConsumer<AuthCubit, AuthCubitState>(
                builder: (context, state) {
                  return PrimaryButton(
                    isLoading: state is AuthCubitLoading,
                    isWhite: true,
                    onPressed: () {
                      context.read<AuthCubit>().login(
                            context: context,
                            signInRequested: SignInRequested(
                              email: emailCtrl.text,
                              password: passwordCtrl.text,
                            ),
                          );
                    },
                    label: "Login ",
                  );
                },
                listener: (BuildContext context, AuthCubitState state) {
                  if (state is AuthCubitSuccess) {
                    context.pushNamed(RouterConstants.home);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
