import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oversize/core/constants/app_colors.dart';

class AppStyle {
  static TextStyle w600s15h20DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.primaryDark,
  );

  static TextStyle w800s17h22Dark = GoogleFonts.roboto(
    fontWeight: FontWeight.w800,
    fontSize: 17,
    height: 22 / 17,
    color: AppColor.cancel,
  );

  static TextStyle w600s18h22DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 22 / 18,
    color: AppColor.primaryDark,
  );

  static TextStyle w400s13h18DarkBlue300 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 18 / 13,
    // color: AppColor.darkBlue300,
  );

  static BoxDecoration get lightGray400R16NoBorder => BoxDecoration(
    color: AppColor.lightGray400,
    borderRadius: BorderRadius.circular(16),
  );

  static TextStyle w500s14h28Black500 = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 28 / 17,
    color: Colors.black,
  );

  static TextStyle w700s18h34DarkBluePrimary = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColor.primaryDark,
  );

  // static TextStyle w500s15h20DarkBlue500 = GoogleFonts.roboto(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 15,
  //   height: 20 / 15,
  //   color: AppColor.darkBlue,
  // );

  // static TextStyle w500s17h20DarkBlue500 = GoogleFonts.roboto(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 17,
  //   height: 20 / 17,
  //   color: AppColor.darkBlue,
  // );

  static BoxDecoration get white16r => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  );
}
