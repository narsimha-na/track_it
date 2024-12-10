import 'package:flutter/material.dart';
import 'package:track_it/core/cosntants.dart';

class PrimaryButton extends StatelessWidget {
  final bool isWhite;
  final Function onPressed;
  final String label;

  const PrimaryButton({
    super.key,
    required this.isWhite,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isWhite ? CustomColors.whiteColor : CustomColors.blueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color:
                  !isWhite ? CustomColors.whiteColor : CustomColors.blueColor,
              fontSize: 16,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
