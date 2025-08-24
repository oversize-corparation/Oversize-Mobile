import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/widgets/product_item_widget.dart';
import 'package:oversize/core/widgets/row_widget.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/card/presentation/widgets/most_popular_products.dart';
import 'package:oversize/features/home/presentation/widgets/sale_tab_widget.dart';

class FlashSaleBody extends StatefulWidget {
  const FlashSaleBody({super.key});

  @override
  State<FlashSaleBody> createState() => _FlashSaleBodyState();
}

class _FlashSaleBodyState extends State<FlashSaleBody> {
  final ValueNotifier<int> type = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          ValueListenableBuilder(
            valueListenable: type,
            builder: (context, value, _) {
              return Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.profileLitTile,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: SingleChildScrollView(
                  // clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SaleTabWidget(
                        label: "all".tr(),
                        isSelected: type.value == 1,
                        ontap: () {
                          type.value = 1;
                        },
                      ),
                      ...List.generate(
                        5,
                        (index) => SaleTabWidget(
                          label: "${(index + 1) * 10}%",
                          isSelected: type.value == index + 2,
                          ontap: () {
                            type.value = index + 2;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          24.h,
          ValueListenableBuilder(
            valueListenable: type,
            builder: (context, value, _) {
              String discount;
              if (value == 1) {
                discount = "products".tr();
              } else {
                discount = "${(value - 1) * 10}% ${"discount".tr()}";
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    discount,
                    style: AppStyle.w700s15Raleway.copyWith(fontSize: 21),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.filter),
                  ),
                ],
              );
            },
          ),
          10.h,
          ValueListenableBuilder(
            valueListenable: type,
            builder: (context, value, _) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                    ontap: () {},
                    image:
                        'https://t3.ftcdn.net/jpg/06/04/85/26/360_F_604852614_H0Ub13DqcP92Mr7e0VOKY1pICV2mi2Ea.jpg',

                    name: "Lorem ipsum dolor sit amet consectetur",
                    price: 16,
                    discount: "20",
                  );
                },
              );
            },
          ),
          23.h,
          RowWidget(title: "popular"),
          10.h,
          MostPopularProducts(),
        ],
      ),
    );
  }
}
