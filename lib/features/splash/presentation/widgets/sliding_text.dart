import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            'Prime Hotel',

            style: Styles.textStyle25.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
