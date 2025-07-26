import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Color? color;

  const ProfileTextField({super.key, this.controller, this.hint, this.color});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
