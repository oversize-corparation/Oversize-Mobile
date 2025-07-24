import 'package:dotted_border/dotted_border.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/features/auth/presentation/export.dart';
import 'package:oversize/features/auth/presentation/widgets/textfield_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(AppImages.bubbleCreate, color: Color(0xff3F5EFB)),
            Align(
              alignment: Alignment(1, -1),
              child: SvgPicture.asset(
                AppImages.bubbleCreate2,
                color: Color(0xffEB00CB),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
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
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: DottedBorder(
                      options: OvalDottedBorderOptions(
                        dashPattern: [20, 5],

                        strokeWidth: 2,
                        color: AppColor.deepPurple,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColor.deepPurple,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 32),

                  // Email
                  TextfieldWidget(hint: 'Email'),
                  SizedBox(height: 16),

                  // Password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      suffixIcon: Icon(Iconsax.eye_slash4),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Phone number
                  // IntlPhoneField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Your number',
                  //     filled: true,
                  //     fillColor: Colors.grey.shade100,
                  //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(32.r),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //   ),
                  //   initialCountryCode: 'GB',
                  // ),
                  SizedBox(height: 32),

                  // Done button
                  ButtonWidget(onPressed: () {}, text: 'Done'),
                  SizedBox(height: 16),

                  // Cancel
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
