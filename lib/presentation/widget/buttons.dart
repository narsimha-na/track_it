import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:track_it/core/cosntants.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color buttonColor;
  final Color textColor;
  bool isLoading;

  PrimaryButton({
    super.key,
    this.buttonColor = CustomColors.whiteColor,
    this.textColor = CustomColors.blueColor,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isLoading) {
          onPressed();
        }
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: !isLoading ? buttonColor : buttonColor.withOpacity(0.8),
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
                    color: textColor,
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: textColor,
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
