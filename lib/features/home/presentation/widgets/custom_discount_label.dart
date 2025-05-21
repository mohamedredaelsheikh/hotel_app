import 'package:flutter/material.dart';

class DiscountLabel extends StatelessWidget {
  final String discount;

  const DiscountLabel({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        '$discount off',
        style: TextStyle(fontSize: 12.0, color: Colors.blue),
      ),
    );
  }
}
