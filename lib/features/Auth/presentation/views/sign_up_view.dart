import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/functions/build_error_snack_bar.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_state.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/sign_up_view_body.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/welcome_signin.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthButtomCubit(),
      child: BlocListener<AuthButtomCubit, AuthButtomState>(
        listener: (context, state) {
          if (state is AuthButtomSuccessState) {
            context.pushReplacement(AppRouter.kSignInView);
          } else if (state is AuthButtonFailureState) {
            showErrorSnackBar(context, state.errorMessage);
          }
        },

        child: Scaffold(
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
        ),
      ),
    );
  }
}
