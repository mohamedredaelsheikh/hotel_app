import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/functions/build_error_snack_bar.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/cubit/resendcubit_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/otp_cubit/cubit/otpcubit_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/email_verification_view_body.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/welcome_signin.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = GoRouterState.of(context).extra as String?;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthButtomCubit()),
        BlocProvider(create: (context) => OtpcubitCubit()),
        BlocProvider(create: (context) => ResendcubitCubit()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
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
                child: BlocConsumer<OtpcubitCubit, OtpcubitState>(
                  listener: (context, state) {
                    if (state is OtpcubitFailure) {
                      showErrorSnackBar(context, state.message);
                    } else if (state is OtpcubitSuccess) {
                      context.pushReplacement(AppRouter.kResetPasswordView);
                    }
                  },
                  builder: (context, state) {
                    return EmailVerificationViewBody(email: email ?? '');
                  },
                ),
              ),
            ),
            WelcomeSignIn(
              title: 'Email Verification',
              subtitle:
                  'Please enter the 6 digit code that send to your email address',
            ),
          ],
        ),
      ),
    );
  }
}
