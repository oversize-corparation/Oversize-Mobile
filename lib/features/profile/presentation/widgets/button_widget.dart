import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileButton extends StatelessWidget {
  final Function()? ontap;
  final Widget icon;
  final Color? color;
  final double? radius;

  const ProfileButton({
    super.key,
    this.ontap,
    required this.icon,
    this.color,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: ontap,
      child: CircleAvatar(backgroundColor: color, child: icon, radius: radius),
    );
  }
}
