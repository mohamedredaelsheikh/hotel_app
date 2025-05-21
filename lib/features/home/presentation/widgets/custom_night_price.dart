import 'package:flutter/material.dart';

class CustomNightPrice extends StatelessWidget {
  const CustomNightPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontScale = screenWidth > 600 ? 1.0 : 0.8;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          price,
          style: TextStyle(
            fontSize: 16.0 * fontScale,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "/Night",
          style: TextStyle(
            fontSize: 18.0 * fontScale,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
