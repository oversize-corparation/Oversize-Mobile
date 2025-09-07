import 'package:carousel_slider/carousel_slider.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/widgets/row_widget.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/card/presentation/widgets/most_popular_products.dart';
import 'package:oversize/features/home/presentation/widgets/comments_tile.dart';
import 'package:oversize/features/home/presentation/widgets/recomended_list.dart';
import 'package:oversize/features/home/presentation/widgets/variation_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsBody extends StatefulWidget {
  final ScrollController scrollController;
  final double scrollOffset;

  const ProductDetailsBody({
    super.key,
    required this.scrollController,
    required this.scrollOffset,
  });

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  final CarouselSliderController _carouselCtrl = CarouselSliderController();
  int _activeIndex = 0;
  String? _selectedColor;
  String? _selectedSize;

  final images = const [
    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double containerTop = size.height * 0.40 - (widget.scrollOffset * 0.5);
    if (containerTop < 56) containerTop = 56;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: size.height * 0.35,
          child: CarouselSlider.builder(
            carouselController: _carouselCtrl,
            itemCount: images.length,
            itemBuilder: (context, index, realIdx) {
              return Image.network(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() => _activeIndex = index);
              },
            ),
          ),
        ),

        Positioned(
          top: size.height * 0.35,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: _activeIndex,
              count: images.length,
              effect: WormEffect(
                spacing: 8.0,
                radius: 8.0,
                dotWidth: 15,
                dotHeight: 15,
                dotColor: Colors.white.withOpacity(0.5),
                activeDotColor: Colors.white,
              ),
              onDotClicked: (index) => _carouselCtrl.animateToPage(index),
            ),
          ),
        ),

        Positioned(
          top: containerTop,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: ListView(
              controller: widget.scrollController,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                10.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$17,00", style: AppStyle.w800s26RalewayBlack),
                    CircleAvatar(
                      backgroundColor: AppColor.lightPink,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.1416),
                        child: Icon(
                          Icons.reply,
                          size: 30,
                          color: AppColor.shadow,
                        ),
                      ),
                    ),
                  ],
                ),
                14.h,
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
                  style: AppStyle.w400s16nunitoSunsBlack,
                ),
                17.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Variations", style: AppStyle.w800s20RalewayBlack),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "${_selectedColor ?? 'Color'} - ${_selectedSize ?? 'Size'}",
                        style: AppStyle.w500s14h28Black500,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => VariationSheet.show(
                        context,
                        _selectedColor,
                        _selectedSize,
                        images,
                        "0",
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.deepPurple,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                12.h,
                Wrap(
                  spacing: 6,
                  children: [
                    ...List.generate(3, (generator) {
                      return Container(
                        decoration: AppDecorations.flashInk,
                        height: 100,
                        width: 100,
                      );
                    }),
                  ],
                ),
                24.h,
                Text("Specifications", style: AppStyle.w800s20RalewayBlack),
                12.h,
                Text("Material", style: AppStyle.w700s18Raleway),
                8.h,
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ["Cotton 95%", "Nylon 5%"].map((material) {
                    return Chip(
                      side: BorderSide.none,
                      label: Text(material, style: AppStyle.w500s14h28Black500),
                      backgroundColor: AppColor.lightPink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }).toList(),
                ),
                15.h,
                Text("Origin", style: AppStyle.w700s18Raleway),
                8.h,
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ["EU"].map((material) {
                    return Chip(
                      side: BorderSide.none,
                      label: Text(material, style: AppStyle.w500s14h28Black500),
                      backgroundColor: AppColor.lightPink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }).toList(),
                ),
                15.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Size guide", style: AppStyle.w700s17Raleway),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.deepPurple,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                23.h,
                Text("Delivery", style: AppStyle.w800s20RalewayBlack),
                12.h,
                Container(
                  decoration: AppDecorations.deliveryContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7,
                    ),
                    child: Row(
                      children: [
                        Text("Standart", style: AppStyle.w500s16hBlack),
                        10.w,
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 11,
                          ),
                          decoration: AppDecorations.size,
                          child: Text(
                            "5-7 days",
                            style: AppStyle.w500s13RalewayPink,
                          ),
                        ),
                        Spacer(),
                        Text("\$3,00", style: AppStyle.w700s17Raleway),
                      ],
                    ),
                  ),
                ),
                30.h,
                Text("Rating & Reviews", style: AppStyle.w800s20RalewayBlack),
                16.h,
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(Icons.star, color: Colors.amber),
                    14.w,
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 11,
                      ),
                      decoration: AppDecorations.size,
                      child: Text("5/5", style: AppStyle.w700s15Raleway),
                    ),
                  ],
                ),
                20.h,
                CommentsTile(
                  rating: 3,
                  maxLines: 3,
                  viewerName: "Veronika",
                  comment:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed ",
                ),
                20.h,
                ButtonWidget(
                  onPressed: () {
                    context.push(AppRouter.comments);
                  },
                  text: "View All Reviews",
                  height: 40,
                ),
                23.h,
                RowWidget(title: "popular"),
                10.h,
                MostPopularProducts(),
                22.h,
                Text("You Might Like", style: AppStyle.w800s20RalewayBlack),
                20.h,
                RecomendedList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
