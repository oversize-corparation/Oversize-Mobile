import 'package:oversize/features/auth/presentation/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          SvgPicture.asset(AppImages.bubbleLogin, color: AppColor.bubble1),
          SvgPicture.asset(AppImages.bubbleLogin2, color: AppColor.bubble2),
          Align(
            alignment: Alignment(1, -0.3),
            child: SvgPicture.asset(
              AppImages.bubbleLogin4,
              color: AppColor.bubble2,
            ),
          ),
          Align(
            alignment: Alignment(1, 1),

            child: SvgPicture.asset(
              AppImages.bubbleLogin3,
              color: AppColor.bubble3,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 12),
                Text(
                  "Login",
                  style: GoogleFonts.raleway(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Good to see you back! 🖤",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                SizedBox(height: 32),

                // Email
                TextfieldWidget(hint: 'Email'),
                SizedBox(height: 8),
                // Password
                TextfieldWidget(hint: 'Password', isPassword: true),

                SizedBox(height: 32),

                // Done button
                ButtonWidget(onPressed: () {}, text: 'Next'),
                SizedBox(height: 16),

                // Cancel
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
        ],
      ),
    );
  }
}
