import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/category/presentation/widgets/category_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Shop",
                    style: AppStyle.w700s18Raleway.copyWith(fontSize: 28),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: InkWell(
                    onTap: () {},
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "searching".tr(),
                        fillColor: Colors.white,
                        suffixIcon: Icon(
                          CupertinoIcons.photo_camera,
                          color: AppColor.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: CategoryBody(),
    );
  }
}
