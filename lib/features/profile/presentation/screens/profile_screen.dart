import 'package:flutter/material.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/profile/presentation/widgets/button_widget.dart';
import 'package:oversize/features/profile/presentation/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: CircleAvatar(),
        actions: [
          ProfileButton(
            ontap: () {},
            icon: SvgPicture.asset(
              AppImages.vaucher,
              color: AppColor.deepPurple,
            ),
            color: AppColor.circleBlur,
          ),
          10.w,
          Badge(
            smallSize: 13,
            largeSize: 60,
            backgroundColor: AppColor.deepPurple,
            child: ProfileButton(
              ontap: () {},
              icon: SvgPicture.asset(
                AppImages.menu,
                color: AppColor.deepPurple,
              ),
              color: AppColor.circleBlur,
            ),
          ),
          10.w,
          ProfileButton(
            ontap: () {
              context.push(AppRouter.settings);
            },
            icon: SvgPicture.asset(
              AppImages.settings,
              color: AppColor.deepPurple,
            ),
            color: AppColor.circleBlur,
          ),
        ],
      ),
      body: ProfileBody(),
    );
  }
}
