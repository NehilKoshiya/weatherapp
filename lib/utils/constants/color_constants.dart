import 'package:flutter/material.dart';

class ColorConstants {
  static const blackColor = Color(0xff000000);
  static const whiteColor = Color(0xffFFFFFF);
  static const blueColor = Colors.blue;
  static const grayColor = Colors.grey;
  static LinearGradient containerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blue,
      Colors.blue[200]!,
      Colors.blue[100]!,
    ],
  );
  static LinearGradient shaderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.white, Colors.white54],
  );
}
