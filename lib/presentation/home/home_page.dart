import 'package:flutter/material.dart';
import 'package:track_it/core/cosntants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'track.it',
          style: TextStyle(
            fontFamily: FontFamily.poppins,
            fontSize: 36,
            color: CustomColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          ImageFile.logo,
          height: 48,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
