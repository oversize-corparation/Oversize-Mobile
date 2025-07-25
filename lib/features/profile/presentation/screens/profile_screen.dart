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
      appBar: AppBar(
        // leading: CircleAvatar(),
        actions: [
          ProfileButton(ontap: () {}, icon: AppImages.vaucher),
          10.w,
          Badge(
            smallSize: 13,
            largeSize: 60,
            backgroundColor: AppColor.darkBlue,
            child: ProfileButton(ontap: () {}, icon: AppImages.menu),
          ),
          10.w,
          ProfileButton(
            ontap: () {
              context.push(AppRouter.settings);
            },
            icon: AppImages.settings,
          ),
        ],
      ),
      body: ProfileBody(),
    );
  }
}
