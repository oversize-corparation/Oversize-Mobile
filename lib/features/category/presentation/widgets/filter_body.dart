import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/category/presentation/widgets/categories_circle.dart';
import 'package:oversize/features/category/presentation/widgets/circle_tick_widget.dart';
import 'package:oversize/features/category/presentation/widgets/size_selector_widget.dart';

class FilterBody extends StatefulWidget {
  const FilterBody({super.key});

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  final ValueNotifier<int> sizeType = ValueNotifier(1);
  String? isSelectedStatus;
  int? isSelectedColor;
  double _start = 20;
  double _end = 80;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        CategoriesCircle(isFilter: true),
        37.h,
        ValueListenableBuilder(
          valueListenable: sizeType,
          builder: (context, value, _) {
            return Row(
              children: [
                Text("size".tr(), style: AppStyle.w800s20RalewayBlack),
                Spacer(),
                ZoomTapAnimation(
                  onTap: () {
                    sizeType.value = 1;
                  },
                  child: Chip(
                    side: sizeType.value == 1
                        ? BorderSide(color: AppColor.deepPink)
                        : BorderSide.none,
                    label: Text("clothes".tr()),
                    backgroundColor: sizeType.value == 1
                        ? AppColor.lightPink
                        : AppColor.lightBlue,
                  ),
                ),
                5.w,
                ZoomTapAnimation(
                  onTap: () {
                    sizeType.value = 2;
                  },
                  child: Chip(
                    side: sizeType.value == 2
                        ? BorderSide(color: AppColor.deepPink)
                        : BorderSide.none,
                    label: Text("shoes".tr()),
                    backgroundColor: sizeType.value == 2
                        ? AppColor.lightPink
                        : AppColor.lightBlue,
                  ),
                ),
              ],
            );
          },
        ),
        13.h,
        ValueListenableBuilder(
          valueListenable: sizeType,
          builder: (context, value, _) =>
              value == 1 ? SizeSelector() : SizeSelector(isClothes: false),
        ),
        27.h,
        Text("color".tr(), style: AppStyle.w800s20RalewayBlack),
        10.h,
        SizedBox(
          height: 60,
          child: ListView.separated(
            separatorBuilder: (context, index) => 16.w,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final selectedIndex = isSelectedColor == index;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedColor = index;
                      });
                    },
                    child: AnimatedScale(
                      duration: Duration(milliseconds: 200),
                      scale: selectedIndex ? 1.0 : 0.9,
                      curve: Curves.easeOutBack,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.all(7),
                        decoration: selectedIndex
                            ? AppDecorations.contaynerBlurCircle.copyWith(
                                border: Border.all(color: AppColor.deepPink),
                              )
                            : AppDecorations.contaynerBlurCircle,
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 20,
                        ),
                      ),
                    ),
                  ),
                  if (selectedIndex)
                    Positioned(
                      right: -3,
                      top: -1,
                      child: AnimatedOpacity(
                        opacity: 1,
                        duration: Duration(milliseconds: 250),
                        child: CircleTickWidget(radius: 13, secondRadius: 10),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        23.h,
        Row(
          children: [
            Text("price".tr(), style: AppStyle.w800s20RalewayBlack),
            Spacer(),
            Text("\$${_start.round()}", style: AppStyle.w500s19Raleway),
            6.w,
            Text("—", style: AppStyle.w500s19Raleway),
            6.w,
            Text("\$${_end.round()}", style: AppStyle.w500s19Raleway),
          ],
        ),
        20.h,
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: AppColor.white,
            activeTrackColor: AppColor.deepPink,
            inactiveTrackColor: AppColor.lightPink,
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 15,
            ),
          ),
          child: RangeSlider(
            values: RangeValues(_start, _end),
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (RangeValues value) {
              setState(() {
                _start = value.start;
                _end = value.end;
              });
            },
          ),
        ),
        25.h,
        GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 30,
          ),
          children: [
            ...[
              "popularF".tr(),
              "newest".tr(),
              "hToLow".tr(),
              "lToHigh".tr(),
            ].map((e) {
              return GestureDetector(
                onTap: () {
                  // print(e);
                  setState(() {
                    isSelectedStatus = e;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  decoration: isSelectedStatus == e
                      ? AppDecorations.pink16r
                      : AppDecorations.white16r,
                  child: Center(
                    child: Text(
                      e,
                      style: isSelectedStatus == e
                          ? AppStyle.w700s15Raleway.copyWith(
                              color: AppColor.deepPink,
                            )
                          : AppStyle.w500s15h20Primary,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
