import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hotel_app/core/utils/styles.dart';

class WelcomeSignIn extends StatelessWidget {
  const WelcomeSignIn({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    double topPosition = 0.1;

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        // لما الـ keyboard تظهر، هنغير مكان النص لفوق (خارج الشاشة)
        topPosition =
            isKeyboardVisible
                ? -0.2 // النص هيتحرك لفوق خارج الشاشة
                : 0.1; // الموقع الافتراضي

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300), // مدة الـ animation
          curve: Curves.easeInOut, // نوع الـ animation
          top: MediaQuery.of(context).size.height * topPosition,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Styles.textStyle24.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
