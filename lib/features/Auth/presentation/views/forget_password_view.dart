import 'package:flutter/material.dart';

import 'package:hotel_app/core/constants/constants.dart';

import 'package:hotel_app/features/Auth/presentation/widgets/forget_password_view_body.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/welcome_signin.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية الزرقاء في الأعلى
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: kPrimaryColor,
          ),
          // الكارت الأبيض اللي فيه الحقول والنصوص
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: const ForgetPasswordViewBody(),
            ),
          ),

          WelcomeSignIn(
            title: 'Forget Password',
            subtitle:
                'Please enter your email address to\nreceive Password reset instruction',
          ),

          // نص "Forget Password" و "Please enter your email address..."
        ],
      ),
    );
  }
}
