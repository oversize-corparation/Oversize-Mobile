import 'package:iconsax/iconsax.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.hint,
    this.isPassword = false,
  });

  final String hint;
  final bool isPassword;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: AppColor.fillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
        hintStyle: GoogleFonts.poppins(
          color: AppColor.hintColor,
          fontSize: 13.83,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscureText ? Iconsax.eye_slash4 : Iconsax.eye3),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }
}
