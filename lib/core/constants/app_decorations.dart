import 'package:oversize/features/app/app_export.dart';

class AppDecorations {
  static BoxDecoration contaynerBlur = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(9),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0,
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );

  static BoxDecoration flashInk = BoxDecoration(
    color: AppColor.lightPink,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration flashwhite = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );
}
