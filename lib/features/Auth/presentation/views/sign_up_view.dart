import 'package:flutter/material.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/sign_up_view_body.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/welcome_signin.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: kPrimaryColor,
          ),

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
              child: const SignUpForm(),
            ),
          ),
          // نص "Hi!" و "Create a new Account"
          WelcomeSignIn(title: 'Hi!', subtitle: 'Create a new Account'),
        ],
      ),
    );
  }
}
