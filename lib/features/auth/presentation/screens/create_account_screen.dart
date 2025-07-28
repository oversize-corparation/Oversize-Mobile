import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/auth/presentation/widgets/imagepicker_widget.dart';
import 'package:oversize/features/auth/presentation/widgets/phonefield_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          SvgPicture.asset(AppImages.bubbleCreate, color: AppColor.bubble1),
          Align(
            alignment: Alignment(1, -1),
            child: SvgPicture.asset(
              AppImages.bubbleCreate2,
              color: AppColor.deepPurple,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.h,
                  Text(
                    "createaccount".tr(),
                    style: GoogleFonts.raleway(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  40.h,

                  // Avatar upload icon
                  ImagePickerWidget(),

                  32.h,

                  // Email
                  TextfieldWidget(hint: 'email'.tr()),
                  8.h,
                  // Password
                  TextfieldWidget(hint: 'password'.tr(), isPassword: true),
                  8.h,

                  // Phone number
                  PhonefieldWidget(),
                  32.h,

                  // Done button
                  ButtonWidget(
                    onPressed: () {
                      context.pushNamed(AppRouter.otp);
                    },
                    text: 'done'.tr(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
