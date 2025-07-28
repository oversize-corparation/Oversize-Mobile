import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/auth/presentation/widgets/otp_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode _otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _otpFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _showDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.topSlide,
      title: 'errordialog'.tr(),
      btnOkText: 'okay'.tr(),
      buttonsTextStyle: GoogleFonts.nunitoSans(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: AppColor.white,
      ),
      customHeader: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFFEBEB),
        ),
        child: Icon(Icons.error_rounded, color: Color(0xffF1AEAE), size: 28),
      ),
      btnOkOnPress: () {},
      headerAnimationLoop: false,
      btnOkColor: AppColor.deepBlack,
      dialogBorderRadius: BorderRadius.circular(19),
      bodyHeaderDistance: 2,
      dialogBackgroundColor: Colors.white,
      padding: EdgeInsets.only(left: 53, bottom: 20, right: 53),
      buttonsBorderRadius: BorderRadius.circular(16),
      titleTextStyle: GoogleFonts.raleway(
        fontWeight: FontWeight.w400,
        color: AppColor.deepBlack,
        fontSize: 18,
        letterSpacing: -0.18,
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(1, -1),
            child: SvgPicture.asset(
              AppImages.bubbleOtp,
              color: AppColor.bubble1,
            ),
          ),
          Align(
            alignment: Alignment(1, -1),
            child: SvgPicture.asset(
              AppImages.bubbleOtp2,
              color: AppColor.deepPurple,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 3),
                  Container(
                    width: 105,
                    height: 105,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.boxShadow,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: AppColor.white,
                    ),
                    child: ClipOval(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'otptitle'.tr(),
                    style: GoogleFonts.raleway(
                      color: AppColor.cancel,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.21,
                    ),
                  ),
                  4.h,
                  Text(
                    textAlign: TextAlign.center,
                    'otpsub'.tr(),
                    style: GoogleFonts.nunitoSans(
                      color: AppColor.deepBlack,
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  13.h,
                  Text(
                    textAlign: TextAlign.center,
                    '+33*****99',
                    style: GoogleFonts.nunitoSans(
                      color: AppColor.deepBlack,
                      fontSize: 16,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  28.h,
                  OtpWidget(focusNode: _otpFocusNode),
                  Spacer(flex: 5),
                  ButtonWidget(
                    onPressed: _showDialog, // Show dialog when clicked
                    text: 'send'.tr(),
                  ),
                  16.h,
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "cancel".tr(),
                        style: GoogleFonts.nunitoSans(
                          color: AppColor.cancel,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
