import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.boxShadow,
                      offset: Offset(0, 3),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Image.asset(AppImages.logoBlack, fit: BoxFit.cover),
              ),
              20.h,
              Text(
                'OverSize',
                style: GoogleFonts.raleway(
                  letterSpacing: -0.52,
                  fontSize: 52,
                  fontWeight: FontWeight.w700,
                ),
              ),
              10.h,
              Text(
                textAlign: TextAlign.center,
                'startsub'.tr(),
                style: GoogleFonts.nunitoSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(),
              ButtonWidget(
                onPressed: () {
                  context.pushNamed(AppRouter.createAccount);
                },
                text: 'startbutt'.tr(),
              ),
              20.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already'.tr(),
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  16.w,
                  ZoomTapAnimation(
                    onTap: () {
                      context.pushNamed(AppRouter.login);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColor.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColor.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
