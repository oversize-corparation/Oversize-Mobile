import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/category/presentation/widgets/category_body.dart';
import 'package:oversize/features/home/presentation/widgets/home_body.dart';
import 'package:oversize/features/home/presentation/widgets/profile_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> type = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, bottom: 16),
            child: ValueListenableBuilder(
              valueListenable: type,
              builder: (context, value, _) {
                return Row(
                  children: [
                    if (value == 1)
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Shop",
                          style: AppStyle.w700s18Raleway.copyWith(fontSize: 28),
                        ),
                      ),
                    Expanded(
                      flex: 8,
                      child: ProfileTextField(
                        hint: "searching".tr(),
                        ontap: value == 1
                            ? () {
                                type.value = 2;
                              }
                            : null,
                      ),
                    ),
                    if (value == 2)
                      TextButton(
                        onPressed: () {
                          type.value = 1;
                        },
                        child: Text("cancel".tr()),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: type,
        builder: (context, value, _) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: value == 1 ? HomeBody() : CategoryBody(),
          );
        },
      ),
    );
  }
}
