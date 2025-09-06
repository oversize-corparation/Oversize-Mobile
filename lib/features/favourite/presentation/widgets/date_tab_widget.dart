import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';

class DateTabWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback ontap;

  const DateTabWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: ontap,
      child: AnimatedContainer(
        height: 30,
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: isSelected
            ? AppDecorations.pink16r
            : AppDecorations.white16r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppStyle.w700s15Raleway.copyWith(color: AppColor.deepPurple)
                  : AppStyle.w700s15Raleway,
            ),
          ],
        ),
      ),
    );
  }
}
