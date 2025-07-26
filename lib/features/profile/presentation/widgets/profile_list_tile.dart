import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_styles.dart';
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
      leading: Text(title.tr(), style: AppStyle.w600s15h20DarkBluePrimary),
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
