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
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: isSelected ? AppStyle.pink16r : const BoxDecoration(),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Matnni markazga joylashtirish
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppStyle.w500s15h20Primary.copyWith(
                      color: AppColor.deepPurple,
                    )
                  : AppStyle.w500s15h20Primary,
            ),
            // if (isSelected) ...[
            //   20.w,
            //   CircleAvatar(
            //     radius: 20,
            //     child: Icon(Icons.check, color: Colors.white, size: 14),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}
