import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_state.dart';
import 'package:hotel_app/features/onboarding/presentation/widgets/onboarding_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  bool _isOnboardingSeen = false;

  @override
  void initState() {
    super.initState();
    _checkIfOnboardingSeen();
  }

  Future<void> _checkIfOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('onboarding_seen') ?? false;

    if (!mounted) return;

    setState(() {
      _isOnboardingSeen = seen;
    });

    if (seen && mounted) {
      context.go(AppRouter.kHomeView);
    }
  }

  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);

    if (!mounted) return;
    context.go(AppRouter.kSignInView);
  }

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/rafiki.svg",
      "text":
          "Book your hotel easily and quickly, and enjoy a comfortable stay at the best prices!",
    },
    {
      "image": "assets/images/pana.svg",
      "text":
          "Find and book your perfect hotel in just a few taps for a seamless stay!",
    },
    {
      "image": "assets/images/cuate.svg",
      "text":
          "Ready for your next trip? Book your hotel in seconds and start your adventure!",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnboardingSeen) {
      return const SizedBox.shrink();
    }

    return BlocProvider(
      create: (context) => AuthButtomCubit(),
      child: BlocListener<AuthButtomCubit, AuthButtomState>(
        listener: (context, state) {},
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    itemBuilder:
                        (context, index) => OnBoardingViewBody(
                          imagePath: onboardingData[index]["image"]!,
                          text: onboardingData[index]["text"]!,
                          isLastPage: index == onboardingData.length - 1,
                          onSkip: () {
                            _completeOnboarding();
                          },
                          onNext: () {
                            if (index == onboardingData.length - 1) {
                              _completeOnboarding();
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          pageController: _pageController,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
