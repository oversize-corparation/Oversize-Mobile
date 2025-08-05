import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/core/widgets/support_dialog.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/profile/presentation/screens/empty_order_screen.dart';
import 'package:oversize/features/profile/presentation/widgets/profile_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 230,
          backgroundColor: AppColor.fillColor,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxHeight < 140;
              return FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                centerTitle: !isCompact,
                title: SafeArea(
                  top: true,
                  bottom: false,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.bounceOut,
                    switchOutCurve: Curves.bounceInOut,
                    duration: const Duration(milliseconds: 500),
                    child: isCompact
                        ? Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: Icon(Icons.person),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'name',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Icon(Icons.person),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'name',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: AppColor.fillColor,
                      color: AppColor.deepPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 150,
                    width: double.infinity,
                  ),
                  24.h,
                  ProfileWidget(
                    icon: Icon(
                      CupertinoIcons.bag,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
                    title: "order",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EmptyOrderScreen();
                          },
                        ),
                      );
                    },
                  ),
                  ProfileWidget(
                    icon: Icon(
                      CupertinoIcons.chat_bubble_text,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
                    title: "sharh",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {},
                  ),
                  ProfileWidget(
                    icon: Icon(
                      Icons.store_outlined,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
                    title: "caller",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {},
                  ),
                  ProfileWidget(
                    icon: Icon(
                      CupertinoIcons.chat_bubble_2,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
                    title: "chat",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {},
                  ),
                  ProfileWidget(
                    icon: Icon(
                      Icons.email_outlined,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
                    title: "connection",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {
                      SupportDialog.show(context);
                    },
                  ),
                  ProfileWidget(
                    icon: SvgPicture.asset(
                      AppImages.settings,
                      color: AppColor.deepPurple,
                      width: 28,
                    ),
                    title: "settings".tr(),
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {
                      context.push(AppRouter.settings);
                    },
                  ),
                  ProfileWidget(
                    icon: Icon(
                      Icons.logout,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
                    title: "logout".tr(),
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    24,
                                    60,
                                    24,
                                    24,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'errordialog'.tr(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.deepBlack,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: Size(200, 50),
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    AppColor.deepBlack,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('cancel'.tr()),
                                            ),
                                          ),
                                          16.w,
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: Size(200, 50),
                                                foregroundColor: Colors.white,
                                                backgroundColor: AppColor.error,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('delete'.tr()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -35,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.boxShadow,
                                          offset: Offset(0, 3),
                                          blurRadius: 8,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFFEBEB),
                                      ),
                                      child: Icon(
                                        Icons.error_rounded,
                                        color: Color(0xffF1AEAE),
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
