import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/widgets/gender_widget.dart';
import 'package:track_it/presentation/auth/widgets/text_feilds.dart';
import 'package:track_it/presentation/widget/buttons.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

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
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                isWhite: true,
                onPressed: () {
                  context.goNamed(
                    RouterConstants.loginPage,
                  );
                },
                label: "Create Account",
              ),
            ),
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
                Row(
                  children: [
                    Expanded(
                      child: AuthTextFeilds(
                        ctrl: nameCtrl,
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
                        ctrl: nameCtrl,
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
                        ctrl: nameCtrl,
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
                          log('tap');
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2028));
                          // CupertinoDatePicker(
                          //     mode: CupertinoDatePickerMode.date,
                          //     initialDateTime: DateTime.now(),
                          //     minimumDate: DateTime(1900),
                          //     maximumDate: DateTime(2028),
                          //     onDateTimeChanged: (va) {
                          //       log(va.toString());
                          //     });
                        },
                        child: AuthTextFeilds(
                          showIcon: true,
                          isDisabled: true,
                          ctrl: nameCtrl,
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
                  onGenderSelected: (gender) {},
                ),
                const SizedBox(
                  height: 36,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(RouterConstants.loginPage);
                    },
                    child: Text(
                      'Already hav a account ? click here to login',
                      style: TextStyle(
                        fontFamily: FontFamily.zk,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: CustomColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
