import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:track_it/core/cosntants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

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

class MainBackground extends StatelessWidget {
  const MainBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageFile.bgImgSplashPage,
      fit: BoxFit.cover,
    );
  }
}

class BackB extends StatelessWidget {
  const BackB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_back_ios_rounded,
      ),
    );
  }
}

const parentPadding = EdgeInsets.only(
  top: 52,
  left: 24,
  right: 24,
  bottom: 48,
);

class CustomLayout extends StatelessWidget {
  final Widget childWidget;
  final Color bgColor;

  const CustomLayout({
    super.key,
    required this.bgColor,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            const MainBackground(),
            childWidget,
          ],
        ));
  }
}

class GeneralWidgets {
  static void toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        fontAsset: FontFamily.poppins,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 87, 86, 86),
        textColor: CustomColors.whiteColor,
        fontSize: 14.0);
  }
}
