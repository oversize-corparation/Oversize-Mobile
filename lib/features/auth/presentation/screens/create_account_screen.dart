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
              color: AppColor.bubble2,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Text(
                    "Create\nAccount",
                    style: GoogleFonts.raleway(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Avatar upload icon
                  ImagePickerWidget(),

                  SizedBox(height: 32),

                  // Email
                  TextfieldWidget(hint: 'Email'),
                  SizedBox(height: 8),
                  // Password
                  TextfieldWidget(hint: 'Password', isPassword: true),
                  SizedBox(height: 8),

                  // Phone number
                  PhonefieldWidget(),
                  SizedBox(height: 32),

                  // Done button
                  ButtonWidget(
                    onPressed: () {
                      context.pushNamed(AppRouter.otp);
                    },
                    text: 'Done',
                  ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
