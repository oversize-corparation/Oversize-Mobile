import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key,required this.focusNode});
final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Pinput(focusNode: focusNode,
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
    );
  }
}
