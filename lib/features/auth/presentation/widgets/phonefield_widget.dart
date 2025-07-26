import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class PhonefieldWidget extends StatelessWidget {
  const PhonefieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      disableLengthCheck: true,
      flagsButtonPadding: EdgeInsetsGeometry.only(left: 20),
      dropdownIconPosition: IconPosition.trailing,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      pickerDialogStyle: PickerDialogStyle(backgroundColor: AppColor.white),
      decoration: InputDecoration(
        hintText: 'phonehint'.tr(),
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: AppColor.hintColor,
          fontSize: 13.83,
          fontWeight: FontWeight.w500,
        ),
        fillColor: AppColor.fillColor,
        constraints: BoxConstraints(),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
    );
  }
}
