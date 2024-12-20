import 'dart:ui';

import 'package:flutter/material.dart';

class ImageFile {
  static const String imgPath = "assets/images/";
  static const String bgImgSplashPage = "${imgPath}bg.png";
  static const String addWeightImg = "${imgPath}add.png";
  static const String streak = "${imgPath}fire.png";
  static const String logo = "${imgPath}logo.png";
  static const String target = "${imgPath}target.png";
  static const String weighMachine = "${imgPath}weighing-machine.png";
}

class CustomColors {
  static const Color blueColor = Color(0xFF072846);
  static const Color darkBlueColor = Color.fromARGB(255, 19, 34, 62);
  static const Color blackColor = Color.fromARGB(255, 7, 3, 55);
  static const Color yellowColor = Color(0xFFF7B400);
  static const Color greyColor = Color(0xFFF2F1F1);
  static const Color darkGreyColor = Color.fromARGB(255, 120, 119, 119);
  static const Color orangeColor = Color(0xFFFD6900);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static LinearGradient bottomGradientColor = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      CustomColors.blackColor,
      CustomColors.blackColor,
      CustomColors.blackColor,
      CustomColors.blackColor,
      CustomColors.blackColor,
      CustomColors.blackColor.withOpacity(0.5),
      CustomColors.blackColor.withOpacity(0.0),
    ],
  );
}

class FontFamily {
  static const String dmSans = 'DMSans';
  static const String poppins = 'Poppins';
  static const String zk = 'ZkBlack';
}

class StorageKey {
  static const String user = 'user';
}
