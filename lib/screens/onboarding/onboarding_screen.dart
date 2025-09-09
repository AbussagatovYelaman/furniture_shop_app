import 'package:flutter/material.dart';
import 'package:furniture_shop_app/config/constants.dart';

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.description,
    required this.image,
    required this.title,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Discover Unique Furniture',
      description: 'Find the perfect pieces to make home truly yours',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'Fast delivery',
      description: 'Get your futniture delivered right to your doorstep',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Discover Unique Furniture',
      description: 'Find the perfect pieces to make home truly yours',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Page view
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(_pages[index]);
            },
          ),
          //skip button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,

            child: TextButton(
              onPressed: _completeOnboarding,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          //bottom controls
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Page indicators
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Container(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPage(OnboardingPage page) {
    return Container(
      color: const Color(0xFFFFF3D9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          //image
          Image.asset(
            page.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.contain,
          ),

          const Spacer(),
          //content
          Padding(
            padding: const EdgeInsetsGeometry.all(24),
            child: Column(
              children: [
                Text(
                  page.title,
                  textAlign: TextAlign.center,
                  style: AppConstants.headingStyle.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: AppConstants.bodyStyle.copyWith(
                    color: Colors.grey[600],
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _completeOnboarding() async {}
}
