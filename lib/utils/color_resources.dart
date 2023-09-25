import 'package:flutter/material.dart';

class ColorResource {
  static var gradientColor = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.blue,
      Colors.white,
      Colors.blueAccent,
      Colors.indigoAccent,
    ],
  );

  static const primaryColor = Color(0xff0662B7);
  static const secondaryColor = Colors.indigoAccent;
  static const white = Color(0xffFFFFFF);
  static const cementWhite = Color(0xffF3F3F4);
  static const black = Color(0xff333333);
  static const black2 = Color(0xff222222);
  static const textColor = Color(0xff838383);
}