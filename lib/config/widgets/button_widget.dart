import 'package:oversize/features/start/presentation/screens/export.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const ButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.nunitoSans(
          fontSize: 22,
          fontWeight: FontWeight.w300,
          color: AppColor.buttonText,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        backgroundColor: AppColor.deepPurple,
        fixedSize: Size(double.maxFinite, 61),
      ),
    );
  }
}
