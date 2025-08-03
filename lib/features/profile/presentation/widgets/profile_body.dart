import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:oversize/features/app/app_export.dart';
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
                centerTitle: !isCompact,
                title: SafeArea(
                  top: true,
                  bottom: false,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: isCompact
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
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
                  ProfileWidget(
                    icon: Icon(
                      CupertinoIcons.bag,
                      color: AppColor.deepPurple,
                      size: 30,
                    ),
                    title: "order",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {},
                  ),
                  ProfileWidget(
                    icon: Icon(
                      CupertinoIcons.chat_bubble_text,
                      color: AppColor.deepPurple,
                      size: 30,
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
                      size: 30,
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
                      size: 30,
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
                      size: 30,
                    ),
                    title: "connection",
                    action: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 24,
                      color: AppColor.deepPurple,
                    ),
                    ontap: () {},
                  ),
                  ProfileWidget(
                    icon: SvgPicture.asset(
                      AppImages.settings,
                      color: AppColor.deepPurple,
                      width: 27,
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
                      size: 30,
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
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(24, 60, 24, 24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'You are going to deleteyour account'
                                            .tr(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "You won't be able to restore your data"
                                            .tr(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              onPressed: () =>
                                                  context.pop(context),
                                              child: Text('cancel'.tr()),
                                            ),
                                          ),
                                          16.w,
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: Text('delete'.tr()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -32,
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.fillColor,
                                    radius: 40,
                                    child: Icon(
                                      Icons.error,
                                      color: AppColor.circlePink,
                                      size: 40,
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
