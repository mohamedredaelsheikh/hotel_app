import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/styles.dart';

class CustomLocationLayout extends StatelessWidget {
  const CustomLocationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location', style: Styles.textStyle14),
              Row(
                children: [
                  Icon(Icons.location_pin, size: 16.0),
                  SizedBox(width: 4.0),
                  Text('New Cairo, Egypt', style: Styles.textStyle16),
                ],
              ),
            ],
          ),
        ),

        Icon(Icons.notifications, size: 24.0),
      ],
    );
  }
}
