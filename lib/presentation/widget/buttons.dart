import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:track_it/core/cosntants.dart';

class PrimaryButton extends StatelessWidget {
  final bool isWhite;
  final Function onPressed;
  final String label;
  bool isLoading;

  PrimaryButton({
    super.key,
    required this.isWhite,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: isWhite ? CustomColors.whiteColor : CustomColors.blueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: isWhite
                        ? CustomColors.blueColor
                        : CustomColors.whiteColor,
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: !isWhite
                        ? CustomColors.whiteColor
                        : CustomColors.blueColor,
                    fontSize: 18,
                    letterSpacing: 0,
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
