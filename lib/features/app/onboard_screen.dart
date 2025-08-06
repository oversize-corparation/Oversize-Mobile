import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboard1.png',
      'title': 'Hello',
      'subtitle':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
    },
    {
      'image': 'assets/images/onboard2.png',
      'title': 'Discover',
      'subtitle': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'image': 'assets/images/onboard1.png',
      'title': 'Shop',
      'subtitle': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'image': 'assets/images/onboard2.png',
      'title': 'Ready?',
      'subtitle': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == onboardingData.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppImages.bubbleLOnboard,
            color: AppColor.deepPurple,
          ),
          if (isLast)
            Align(
              alignment: Alignment(1, 1),
              child: SvgPicture.asset(AppImages.bubbleLOnboard2),
            ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) =>
                        setState(() => _currentIndex = index),
                    itemBuilder: (context, index) {
                      final data = onboardingData[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                child: Image.asset(
                                  data['image']!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['title']!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.raleway(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  12.h,
                                  Text(
                                    data['subtitle']!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  30.h,
                                  if (isLast)
                                    SizedBox(
                                      width: 201,
                                      child: ButtonWidget(
                                        onPressed: () {
                                          // TODO: Navigate to home or login
                                        },

                                        text: "Let's Start",
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: WormEffect(
                    dotHeight: 20,
                    dotWidth: 20,
                    spacing: 8,
                    activeDotColor: AppColor.deepPurple,
                    dotColor: AppColor.bubble1,
                  ),
                ),
                40.h,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
