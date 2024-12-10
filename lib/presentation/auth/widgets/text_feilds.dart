// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:track_it/core/cosntants.dart';

class AuthTextFeilds extends StatelessWidget {
  const AuthTextFeilds({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.ctrl,
    this.isDisabled = false,
    this.showIcon = false,
    this.isPassword = false,
    required this.measuringUnit,
  });

  final String firstName;
  final String secondName;
  final String measuringUnit;
  final bool showIcon;
  final bool isPassword;
  final TextEditingController ctrl;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: const TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 16,
              fontFamily: FontFamily.zk,
              fontWeight: FontWeight.w800,
            ),
            children: [
              TextSpan(
                text: firstName,
              ),
              TextSpan(
                text: '$secondName',
                style: const TextStyle(
                  color: CustomColors.yellowColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          cursorColor: CustomColors.greyColor,
          enabled: !isDisabled,
          textAlignVertical: TextAlignVertical.center,
          obscureText: isPassword,
          scrollPadding: EdgeInsets.zero,
          style: const TextStyle(
            color: CustomColors.whiteColor,
            fontSize: 16,
            height: 1,
            fontFamily: FontFamily.zk,
            fontWeight: FontWeight.w800,
          ),
          decoration: showIcon
              ? _withIconTextFeild(icon: Icons.calendar_month_rounded)
              : _withoutIconTextFeild(measuringUnit: measuringUnit),
        ),
      ],
    );
  }

  _withoutIconTextFeild({required String measuringUnit}) {
    return InputDecoration(
      suffixText: measuringUnit,
      suffixStyle: const TextStyle(
        color: CustomColors.greyColor,
        fontSize: 18,
        fontFamily: FontFamily.zk,
        fontWeight: FontWeight.w800,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      border: _borderStyles(),
      disabledBorder: _borderStyles(),
      enabledBorder: _borderStyles(),
      focusedBorder: _borderStyles(isFocused: true),
    );
  }

  _withIconTextFeild({required IconData icon}) {
    return InputDecoration(
      suffixIcon: Icon(
        icon,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      suffixIconColor: CustomColors.greyColor,
      border: _borderStyles(),
      enabledBorder: _borderStyles(),
      disabledBorder: _borderStyles(),
      focusedBorder: _borderStyles(isFocused: true),
    );
  }

  _borderStyles({bool isFocused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
      borderSide: BorderSide(
        color: CustomColors.greyColor,
        width: isFocused ? 3 : 1,
      ),
    );
  }
}
