import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewapp/utils/constants/color_constants.dart';
import 'package:interviewapp/utils/constants/string_constants.dart';
import 'package:sizer/sizer.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onSubmit;

  const TextfieldWidget(
      {super.key, required this.textEditingController, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextField(
        controller: textEditingController,
        onSubmitted: onSubmit,
        style: GoogleFonts.urbanist(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.blackColor,
        ),
        decoration: InputDecoration(
          hintText: StringConstants.hintText,
          hintStyle: GoogleFonts.urbanist(
            color: ColorConstants.grayColor,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: ColorConstants.grayColor,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
