import 'package:flutter/cupertino.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class SearchTextField extends StatelessWidget {
  final String? hint;
  final Function()? ontap;
  const SearchTextField({super.key, this.hint, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.fillColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hint ?? ""),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.photo_camera,
                  color: AppColor.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
