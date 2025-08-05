import 'package:flutter/material.dart';
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
    {'image': 'assets/images/onboard1.png', 'title': 'Hello'},
    {'image': 'assets/images/onboard2.png', 'title': 'Discover'},
    {'image': 'assets/images/onboard1.png', 'title': 'Shop'},
    {'image': 'assets/images/onboard2.png', 'title': 'Ready?'},
  ];
  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == onboardingData.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          // Top Purple Background
          Container(
            height: 350,
            decoration: const BoxDecoration(
              color: Color(0xFFE600B5),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 60),

              // ===== Carousel (Image + Title + Dots) =====
              SizedBox(
                height: 320,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    final data = onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            data['image']!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data['title']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SmoothPageIndicator(
                controller: _pageController,
                count: onboardingData.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 8,
                  activeDotColor: Colors.white,
                  dotColor: Colors.white24,
                  expansionFactor: 3,
                ),
              ),

              const SizedBox(height: 40),

              // ===== Static Bottom Container =====
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed non consectetur turpis. Morbi eu eleifend lacus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),

                      if (isLast)
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Navigate to home or login
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE600B5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Let's Start",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
