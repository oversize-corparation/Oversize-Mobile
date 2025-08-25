import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/home/presentation/widgets/flesh_time.dart';

class FleshSaleItems extends StatelessWidget {
  final int discount;
  const FleshSaleItems({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 280,
      child: GestureDetector(
        onTap: () => context.push(AppRouter.flashSale),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                Text(
                  "sale".tr(),
                  style: AppStyle.w700s18Raleway.copyWith(fontSize: 21),
                ),
                Spacer(),
                Icon(Icons.timer_outlined, color: AppColor.deepPurple),
                FleshTime(time: "00"),
                FleshTime(time: "36"),
                FleshTime(time: "58"),
              ],
            ),
            10.h,
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Ink(
                      decoration: AppDecorations.contaynerBlur,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Ink(
                          // height: 114,
                          // width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppColor.saleGradient,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "-$discount%",
                          style: AppStyle.w700s15Raleway.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
