import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/constants/app_images.dart';
import 'package:oversize/core/source/main_source.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: ListenableBuilder(
        listenable: MainSources.currentPage,
        builder: (context, child) {
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: MainSources.currentPage.value,
            onTap: (value) async {
              MainSources.currentPage.value = value;
              widget.navigationShell.goBranch(value);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.home,
                  height: 24,
                  color: MainSources.currentPage.value == 0
                      ? AppColor.deepBlack
                      : AppColor.deepPurple,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.favourite,
                  height: 24,
                  color: MainSources.currentPage.value == 1
                      ? AppColor.deepBlack
                      : AppColor.deepPurple,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.category,
                  height: 24,
                  color: MainSources.currentPage.value == 2
                      ? AppColor.deepBlack
                      : AppColor.deepPurple,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  backgroundColor: AppColor.deepPurple,
                  largeSize: 20,
                  smallSize: 10,
                  child: SvgPicture.asset(
                    AppImages.card,
                    height: 24,
                    color: MainSources.currentPage.value == 3
                        ? AppColor.deepBlack
                        : AppColor.deepPurple,
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profile,
                  height: 24,
                  color: MainSources.currentPage.value == 4
                      ? AppColor.deepBlack
                      : AppColor.deepPurple,
                ),
                label: "",
              ),
            ],
          );
        },
      ),
    );
  }
}
