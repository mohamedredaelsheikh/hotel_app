import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/functions/build_error_snack_bar.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_state.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/email_verification_view_body.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/welcome_signin.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = GoRouterState.of(context).extra as String?;

    return BlocProvider(
      create: (context) => AuthButtomCubit(),
      child: BlocListener<AuthButtomCubit, AuthButtomState>(
        listener: (context, state) {
          if (state is AuthButtomSuccessState) {
            context.pushReplacement(AppRouter.kResetPasswordView);
          } else if (state is AuthButtonFailureState) {
            showErrorSnackBar(context, state.errorMessage);
          }
        },
        child: Scaffold(
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
                  child: EmailVerificationViewBody(email: email ?? ''),
                ),
              ),

              WelcomeSignIn(
                title: 'Email Verification',
                subtitle:
                    'Please enter the 6 digit code that send to your email address',
              ),

              // نص "Forget Password" و "Please enter your email address..."
            ],
          ),
        ),
      ),
    );
  }
}
