import 'package:flutter/material.dart';
import 'package:hotel_app/core/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttomname,
    required this.onTap,
    required this.backgroundColor,

    required this.textColor,
  });

  final String buttomname;
  final void Function()? onTap;
  final Color? backgroundColor;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kPrimaryColor, width: 2),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            buttomname,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
