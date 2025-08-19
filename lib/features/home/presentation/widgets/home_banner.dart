import 'package:carousel_slider/carousel_slider.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final CarouselSliderController _carouselCtrl = CarouselSliderController();
  int _activeIndex = 0;

  final images = const [
    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselCtrl,
          itemCount: images.length,
          itemBuilder: (context, index, realIdx) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            clipBehavior: Clip.none,
            aspectRatio: 335 / 130,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() => _activeIndex = index);
            },
          ),
        ),
        10.h,
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: images.length,
          effect: WormEffect(
            spacing: 8.0,
            radius: 8.0,
            dotWidth: 15,
            dotHeight: 15,
            dotColor: AppColor.circlePink.withOpacity(0.5),
            activeDotColor: AppColor.deepPurple,
          ),
          onDotClicked: (index) => _carouselCtrl.animateToPage(index),
        ),
      ],
    );
  }
}
