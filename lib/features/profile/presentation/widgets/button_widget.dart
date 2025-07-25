import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileButton extends StatelessWidget {
  final Function()? ontap;
  final String icon;

  const ProfileButton({super.key, this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: ontap,
      child: CircleAvatar(
        backgroundColor: AppColor.circleBlur,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
