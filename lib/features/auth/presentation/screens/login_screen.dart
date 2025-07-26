import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

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
                  "login".tr(),
                  style: GoogleFonts.raleway(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),

                4.h,
                Text(
                  "loginsub".tr(),
                  style: GoogleFonts.nunitoSans(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                32.h,

                // Email
                TextfieldWidget(hint: 'email'.tr()),
                8.h, // Password
                TextfieldWidget(hint: 'password'.tr(), isPassword: true),

                32.h,

                // Done button
                ButtonWidget(
                  onPressed: () {
                    context.pushNamed(AppRouter.pinSetup);
                  },
                  text: 'next'.tr(),
                ),
                16.h,

                // Cancel
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
        ],
      ),
    );
  }
}
