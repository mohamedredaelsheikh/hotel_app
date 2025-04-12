import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/core/utils/constants.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatelessWidget {
  final String imagePath;
  final String text;
  final bool isLastPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final PageController pageController;

  const OnBoardingViewBody({
    super.key,
    required this.imagePath,
    required this.text,
    required this.isLastPage,
    required this.onSkip,
    required this.onNext,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(imagePath, width: 500, height: 500)),
          const SizedBox(height: 25),
          Text(text, textAlign: TextAlign.center, style: Styles.textStyle16),

          const SizedBox(height: 40),

          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: kPrimaryColor,
              dotColor: Colors.grey,
              spacing: 4,
            ),
          ),
          const SizedBox(height: 50),

          Visibility(
            visible: !isLastPage,

            replacement: const SizedBox(height: 60),
            child: CustomButton(
              buttomname: 'Skip',
              textColor: Colors.white,
              backgroundColor: kPrimaryColor,
              //   foregroundColor: Colors.white,
              onTap: onSkip,
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            buttomname: isLastPage ? 'Get Started' : 'Next',
            textColor: isLastPage ? Colors.white : kPrimaryColor,
            backgroundColor: isLastPage ? kPrimaryColor : Colors.white,

            onTap: onNext,
          ),
        ],
      ),
    );
  }
}
