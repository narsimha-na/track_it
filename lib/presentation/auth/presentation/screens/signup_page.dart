import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/cubit/auth_cubit.dart';
import 'package:track_it/presentation/auth/data/models/singup_requested.dart';
import 'package:track_it/presentation/auth/presentation/widgets/gender_widget.dart';
import 'package:track_it/presentation/auth/presentation/widgets/text_feilds.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController mobileNumberCtrl = TextEditingController();
  TextEditingController currentWCtrl = TextEditingController();
  TextEditingController targetWCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController genderCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      bgColor: CustomColors.blueColor,
      childWidget: Padding(
        padding: const EdgeInsets.fromLTRB(0, 52, 0, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 160),
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
                  height: 16,
                ),
                const Text(
                  'Enter your details',
                  style: TextStyle(
                    fontFamily: FontFamily.zk,
                    fontSize: 26,
                    color: CustomColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthTextFeilds(
                    ctrl: nameCtrl,
                    firstName: 'Na',
                    secondName: 'me :',
                    measuringUnit: ""),
                const SizedBox(
                  height: 16,
                ),
                AuthTextFeilds(
                    ctrl: emailCtrl,
                    firstName: 'Ema',
                    secondName: 'il :',
                    measuringUnit: ""),
                const SizedBox(
                  height: 16,
                ),
                AuthTextFeilds(
                    ctrl: passwordCtrl,
                    isPassword: true,
                    firstName: 'Pass',
                    secondName: 'word :',
                    measuringUnit: ""),
                const SizedBox(
                  height: 16,
                ),
                AuthTextFeilds(
                    ctrl: mobileNumberCtrl,
                    firstName: 'Mobile',
                    secondName: 'Number :',
                    measuringUnit: ""),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AuthTextFeilds(
                        ctrl: targetWCtrl,
                        measuringUnit: "KG",
                        firstName: 'Target',
                        secondName: ' Weight :',
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: AuthTextFeilds(
                        ctrl: currentWCtrl,
                        measuringUnit: "KG",
                        firstName: 'Current',
                        secondName: ' Weight :',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AuthTextFeilds(
                        ctrl: heightCtrl,
                        measuringUnit: "Feet",
                        firstName: 'Hei',
                        secondName: 'ght',
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2028))
                              .then((val) {
                            if (mounted && val != null) {
                              context.read<AuthCubit>().setDob(val);
                              dobCtrl.text =
                                  DateFormat('dd/MM/yyyy').format(val);
                            }
                          });
                        },
                        child: AuthTextFeilds(
                          showIcon: true,
                          isDisabled: true,
                          ctrl: dobCtrl,
                          measuringUnit: '',
                          firstName: 'Date o',
                          secondName: 'f birth :',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GenderWidget(
                  onGenderSelected: (gender) {
                    context.read<AuthCubit>().setGender(gender);
                  },
                ),
                const SizedBox(
                  height: 36,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Text(
                      'Already hav a account ? click here to login',
                      style: TextStyle(
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
              ],
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              decoration: BoxDecoration(
                gradient: CustomColors.bottomGradientColor,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<AuthCubit, AuthCubitState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      isWhite: true,
                      isLoading: state is AuthCubitLoading,
                      onPressed: () {
                        context.read<AuthCubit>().signUp(
                              signUpRequested: SignUpRequested(
                                name: nameCtrl.text,
                                email: emailCtrl.text,
                                password: passwordCtrl.text,
                                mobileNumber: int.parse(
                                    mobileNumberCtrl.text.isEmpty
                                        ? "0"
                                        : mobileNumberCtrl.text),
                                targetWeight: double.parse(
                                    targetWCtrl.text.isEmpty
                                        ? "0.0"
                                        : targetWCtrl.text),
                                currentWeight: double.parse(
                                    currentWCtrl.text.isEmpty
                                        ? "0.0"
                                        : currentWCtrl.text),
                                height: double.parse(heightCtrl.text.isEmpty
                                    ? "0.0"
                                    : heightCtrl.text),
                                gender: context.read<AuthCubit>().gender,
                                age: context.read<AuthCubit>().dob,
                              ),
                            );
                      },
                      label: "Create Account",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
