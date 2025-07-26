import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              color: AppColor.bubble2,
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
                  Pinput(
                    length: 4,
                    defaultPinTheme: PinTheme(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      width: 49.3,
                      height: 50.56,
                      decoration: BoxDecoration(
                        color: AppColor.fillColor,
                        borderRadius: BorderRadius.circular(10.11),
                      ),
                    ), // pastel ko‘k rang,
                    onCompleted: (pin) => print('Entered PIN: $pin'),
                  ),
                  Spacer(flex: 5),
                  ButtonWidget(onPressed: () {}, text: 'send'.tr()),
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
