import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/custom_otp_widget.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final otpKey = GlobalKey<CustomOtpWidgetState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomOtpWidget(key: otpKey),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t receive an OTP?'),
              TextButton(
                onPressed: () {
                  otpKey.currentState?.clearFields();
                },
                child: Text('Resend', style: TextStyle(color: kPrimaryColor)),
              ),
            ],
          ),
          CustomButton(
            buttomname: 'Verify',
            textColor: Colors.white,
            backgroundColor: kPrimaryColor,

            onTap: () {
              context.go(AppRouter.kResetPasswordView);
            },
          ),
          SizedBox(height: 16.0),

          CustomButton(
            buttomname: 'Cancel',
            textColor: kPrimaryColor,
            backgroundColor: Colors.white,

            onTap: () {
              // رجّع المستخدم لشاشة SignInView
              context.go(AppRouter.kSignInView);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
