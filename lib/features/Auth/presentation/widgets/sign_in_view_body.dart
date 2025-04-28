import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/sign_in_usecase.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // حقل الـ Email
              Text(
                'Email',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                hintText: 'Email',
              ),
              const SizedBox(height: 16),

              // حقل الـ Password
              Text(
                'Password',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormTextField(
                controller: passwordController,
                hintText: 'Password',
                obscure: true,
              ),
              const SizedBox(height: 12),

              // رابط "Forget Your Password?"
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // هنا ممكن تنقل لشاشة إعادة تعيين كلمة المرور
                    context.go(AppRouter.kForgotPasswordView);
                  },
                  child: Text(
                    'Forget Your Password?',
                    style: Styles.textStyle16.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // زرار "Sign in"
              BlocProvider.value(
                value: context.read<AuthButtomCubit>(),
                child: CustomButton(
                  buttomname: 'Sign in',
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthButtomCubit>().excute(
                        usecase: getit<SignInUsecase>(),
                        params: SignInReqModel(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              // نص "Don't have an account? Sign Up"
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Styles.textStyle14.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Styles.textStyle14.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // هنا ممكن تنقل لشاشة التسجيل (Sign Up)
                                context.go(AppRouter.kSignUpView);
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
