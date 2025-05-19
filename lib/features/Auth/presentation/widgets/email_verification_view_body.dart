import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/forget_password_usecase.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/custom_otp_widget.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    // final email = ModalRoute.of(context)!.settings.arguments as String;
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
                  context.read<AuthButtomCubit>().excute(
                    usecase: getit<ForgetPasswordUsecase>(),
                    params: email,
                  );
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
