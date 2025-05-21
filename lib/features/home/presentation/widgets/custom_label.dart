import 'package:flutter/material.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/styles.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: Styles.textStyle16.copyWith(color: kPrimaryColor)),
        TextButton(
          onPressed: () {},
          child: Text(
            text2,
            style: Styles.textStyle16.copyWith(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
