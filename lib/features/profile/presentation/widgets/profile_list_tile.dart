import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oversize/core/extension/space_extension.dart';

class ProfileListTile extends StatelessWidget {
  final Function()? ontap;
  final String title;
  final String? label;

  const ProfileListTile({
    super.key,
    this.ontap,
    required this.title,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Text(
        title.tr(),
        style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      trailing: label != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label!),
                10.w,
                Icon(Icons.arrow_forward_ios, size: 20),
              ],
            )
          : Icon(Icons.arrow_forward_ios, size: 20),
    );
  }
}
