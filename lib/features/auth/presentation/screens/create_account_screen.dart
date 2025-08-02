import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/auth/presentation/widgets/phonefield_widget.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

                  80.h,
                  TextfieldWidget(
                    hint: 'firstname'.tr(),
                    controller: firstNameController,
                  ),
                  8.h,
                  TextfieldWidget(
                    hint: 'lastname'.tr(),
                    controller: lastNameController,
                  ),
                  8.h,
                  // Email
                  TextfieldWidget(
                    hint: 'email'.tr(),
                    controller: emailController,
                  ),
                  8.h,
                  // Password
                  TextfieldWidget(
                    hint: 'password'.tr(),
                    isPassword: true,
                    controller: passwordController,
                  ),
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
