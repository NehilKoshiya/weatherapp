import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewapp/utils/constants/color_constants.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.color = ColorConstants.blackColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.center,
    this.decoration = TextDecoration.none,
    this.maxLine,
    this.textOverflow,
    this.height,
    this.textStyle,
  });
  final Color color;
  final String text;
  final double? height;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final int? maxLine;
  final TextDecoration decoration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      style: textStyle ??
          GoogleFonts.urbanist(
            textStyle: TextStyle(
              decoration: decoration,
              decorationColor: color,
              color: color,
              height: height,
              fontWeight: fontWeight,
              fontSize: fontSize.sp,
            ),
          ),
    );
  }
}
