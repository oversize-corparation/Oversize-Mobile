import 'package:oversize/features/app/app_export.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isLoading; // ✅ added

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false, // ✅ default false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // disable when loading
      style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        backgroundColor: AppColor.deepPurple,
        fixedSize: const Size(double.maxFinite, 61),
      ),
      child: isLoading
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.buttonText),
              ),
            )
          : Text(
              text,
              style: GoogleFonts.nunitoSans(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: AppColor.buttonText,
              ),
            ),
    );
  }
}
