import 'package:flutter/material.dart';

class CustomHotelImage extends StatelessWidget {
  const CustomHotelImage({
    super.key,
    required this.imageUrl,
    this.radius,
    this.height,
  });
  final String imageUrl;
  final double? radius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageUrl, height: height, fit: BoxFit.cover),
        Positioned(
          top: 8.0,
          right: 8.0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: radius,
            child: Icon(Icons.favorite, color: Colors.blue, size: 24.0),
          ),
        ),
      ],
    );
  }
}
