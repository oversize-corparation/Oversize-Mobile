import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/category/presentation/widgets/circle_tick_widget.dart';

class CategoriesCircle extends StatefulWidget {
  final bool isFilter;
  const CategoriesCircle({super.key, this.isFilter = false});

  @override
  State<CategoriesCircle> createState() => _CategoriesCircleState();
}

class _CategoriesCircleState extends State<CategoriesCircle> {
  List<int> selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.7,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        final isSelected = selectedIndex.contains(index);

        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ZoomTapAnimation(
                  onTap: widget.isFilter
                      ? () {
                          setState(() {
                            if (isSelected) {
                              selectedIndex.remove(index);
                            } else {
                              selectedIndex.add(index);
                            }
                          });
                        }
                      : () {},
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: AppDecorations.contaynerBlurCircle,
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 25,
                    ),
                  ),
                ),
                if (isSelected)
                  Positioned(right: -5, top: -5, child: CircleTickWidget()),
              ],
            ),
            5.h,
            Text(
              "data",
              style: AppStyle.w500s13RalewayPink.copyWith(color: Colors.black),
            ),
          ],
        );
      },
    );
  }
}
