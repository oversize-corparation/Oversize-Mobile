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
                    'Otp success',
                    style: GoogleFonts.raleway(
                      color: AppColor.cancel,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.21,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.center,
                    'Enter 4-digits code we sent you on your phone number',
                    style: GoogleFonts.nunitoSans(
                      color: AppColor.deepBlack,
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 13),
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
                  SizedBox(height: 28),
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
                  SizedBox(
                    width: 200,
                    child: ButtonWidget(onPressed: () {}, text: 'Send Again'),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
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
