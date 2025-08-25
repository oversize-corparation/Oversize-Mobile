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

// class DiscountSelectorDemo extends StatefulWidget {
//   const DiscountSelectorDemo({super.key});

//   @override
//   State<DiscountSelectorDemo> createState() => _DiscountSelectorDemoState();
// }

// class _DiscountSelectorDemoState extends State<DiscountSelectorDemo> {
//   int selectedIndex = 2;
//   final discounts = ['All', '10%', '20%', '30%', '40%', '50%'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade100,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: List.generate(discounts.length, (index) {
//               final isSelected = index == selectedIndex;

//               return GestureDetector(
//                 onTap: () {
//                   setState(() => selectedIndex = index);
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: isSelected
//                               ? Border.all(color: Colors.blue, width: 2)
//                               : null,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           discounts[index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 13,
//                             color: isSelected ? Colors.blue : Colors.black87,
//                           ),
//                         ),
//                       ),
//                       if (isSelected)
//                         Positioned(
//                           top: 0, // ichida bo‘lishi uchun
//                           left: 0,
//                           right: 0,
//                           child: CustomPaint(
//                             size: const Size(10, 5), // juda kichkina
//                             painter: SmallDownArrowPainter(color: Colors.blue),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SmallDownArrowPainter extends CustomPainter {
//   final Color color;
//   SmallDownArrowPainter({required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = color;
//     final path = Path()
//       ..moveTo(size.width / 2, size.height) // past markaz
//       ..lineTo(0, 0) // chap yuqori
//       ..lineTo(size.width, 0) // o‘ng yuqori
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
