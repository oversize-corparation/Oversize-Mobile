import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

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
                  SizedBox(height: 8),
                  // Password
                  TextfieldWidget(hint: 'Password', isPassword: true),
                  SizedBox(height: 8),

                  // Phone number
                  IntlPhoneField(
                    disableLengthCheck: true,
                    flagsButtonPadding: EdgeInsetsGeometry.only(left: 20),
                    dropdownIconPosition: IconPosition.trailing,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: AppColor.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Your number',
                      filled: true,
                      hintStyle: GoogleFonts.poppins(
                        color: AppColor.hintColor,
                        fontSize: 13.83,
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: AppColor.fillColor,
                      constraints: BoxConstraints(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialCountryCode: 'UZ', // Dastlabki mamlakat kodi
                    dropdownIcon: Icon(
                      Icons
                          .keyboard_arrow_down_rounded, // Dropdown ikonasini o‘ng tomonga joylashtirish
                      color: AppColor.dropIcon, // Ikonaning rangi
                    ),
                    showDropdownIcon: true, // Dropdown ikonasi ko‘rsatilsin
                  ),
                  SizedBox(height: 32),

                  // Done button
                  ButtonWidget(onPressed: () {}, text: 'Done'),
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
