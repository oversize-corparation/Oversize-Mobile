import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/auth/presentation/widgets/otp_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final email = GoRouterState.of(context).extra as String;
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
                    '$email',
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    24,
                                    60,
                                    24,
                                    24,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'errordialog'.tr(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.deepBlack,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(200, 50),
                                          foregroundColor: Colors.white,
                                          backgroundColor: AppColor.deepBlack,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('okay'.tr()),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -35,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.boxShadow,
                                          offset: Offset(0, 3),
                                          blurRadius: 8,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFFEBEB),
                                      ),
                                      child: Icon(
                                        Icons.error_rounded,
                                        color: Color(0xffF1AEAE),
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }, // Show dialog when clicked
                    text: 'next'.tr(),
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
