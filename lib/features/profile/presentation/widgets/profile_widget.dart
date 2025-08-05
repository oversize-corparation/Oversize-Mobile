import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/features/app/app_export.dart';

class ProfileWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget action;
  final Function()? ontap;
  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.ontap,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      end: 0.98,
      onTap: ontap,
      child: Container(
        height: 75,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColor.fillColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              icon,
              20.w,
              Text(
                title.tr(),
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
