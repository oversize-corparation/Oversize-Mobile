import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oversize/core/constants/app_colors.dart';

class AppStyle {
  static TextStyle w300s16hnunitoSunsWhite = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: Colors.white,
  );

  static TextStyle w300s22hnunitoSunsWhite = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w300,
    fontSize: 22,
    color: Colors.white,
  );

  static TextStyle w400s14hnunitoSunsBlack = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle w400s16nunitoSunsBlack = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle w400s13h18DarkBlue300 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 18 / 13,
  );

  static TextStyle w500s13RalewayPink = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: AppColor.deepPink,
  );

  static TextStyle w500s14h28Black500 = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 28 / 17,
    color: Colors.black,
  );

  static TextStyle w500s16hBlack = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 28 / 17,
    color: Colors.black,
  );

  static TextStyle w500s15h20Primary = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.primaryDark,
  );

  static TextStyle w500s19Raleway = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
    fontSize: 19,
  );

  static TextStyle w600s15h20DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.primaryDark,
  );

  static TextStyle w600s16h22DarkBluePrimary = GoogleFonts.raleway(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 22 / 18,
    color: AppColor.primaryDark,
  );

  static TextStyle w600s18h22DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 22 / 18,
    color: AppColor.primaryDark,
  );

  static BoxDecoration lightGray100R14B1White = BoxDecoration(
    color: AppColor.lightGray100,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(width: 1, color: Colors.white),
  );

  static TextStyle w700s15Raleway = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColor.cancel,
  );

  static TextStyle w700s17Raleway = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: AppColor.cancel,
  );

  static TextStyle w700s18Raleway = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColor.cancel,
  );

  static TextStyle w700s21Raleway = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 21,
    color: AppColor.cancel,
  );

  static TextStyle w700s28Raleway = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: AppColor.cancel,
  );

  static TextStyle w800s13Ralewaypink = GoogleFonts.raleway(
    fontWeight: FontWeight.w800,
    fontSize: 13,
    color: AppColor.lightPink2,
  );

  static TextStyle w800s17h22Dark = GoogleFonts.roboto(
    fontWeight: FontWeight.w800,
    fontSize: 17,
    height: 22 / 17,
    color: AppColor.cancel,
  );

  static TextStyle w800s26RalewayBlack = GoogleFonts.raleway(
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: Colors.black,
  );

  static TextStyle w800s20RalewayBlack = GoogleFonts.raleway(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.black,
  );
}
