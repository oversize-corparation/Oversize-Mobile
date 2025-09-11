import 'package:oversize/features/app/app_export.dart';

class AppDecorations {
  static BoxDecoration contaynerBlurCircle = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );

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
  static BoxDecoration border16 = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration white16r = BoxDecoration(
    color: AppColor.profileLitTile,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration pink16r = BoxDecoration(
    color: AppColor.circlePink,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration size = BoxDecoration(
    color: AppColor.lightPink,
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration greySize = BoxDecoration(
    color: AppColor.circleBlur,
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration deliveryContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: AppColor.deepPink),
  );

  static BoxDecoration lightGray400R16NoBorder = BoxDecoration(
    color: AppColor.lightGray400,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration lightPinkBorderR20 = BoxDecoration(
    color: AppColor.lightPink,
    borderRadius: BorderRadius.circular(20),
  );
}
