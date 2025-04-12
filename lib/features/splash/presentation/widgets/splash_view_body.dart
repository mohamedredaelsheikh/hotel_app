import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateBasedOnOnboardingStatus();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SlidingText(slidingAnimation: slidingAnimation));
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  Future<void> navigateBasedOnOnboardingStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('onboarding_seen') ?? false;

    if (!mounted) return;

    if (hasSeenOnboarding) {
      GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);
    }
  }
}
