import 'package:flutter/material.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/styles.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    this.onChange,
    required this.hintText,
    this.obscure = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.hintStyle,
  });
  final String? Function(String?)? validator;
  final bool obscure;
  final String hintText;
  final TextStyle? hintStyle;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? Styles.textStyle16.copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        suffixIcon: suffixIcon,
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter required data';
        }
        if (keyboardType == TextInputType.emailAddress) {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Please enter a valid email';
          }
        }
        return null;
      },
      onChanged: onChange,
    );
  }
}
