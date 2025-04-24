import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // حقل الـ Name
              Text(
                'Name',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormTextField(controller: nameController, hintText: 'Name'),
              const SizedBox(height: 16),

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

                hintText: 'Email',
                obscure: true,
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
              const SizedBox(height: 16),

              // حقل الـ Confirm Password
              Text(
                'Confirm Password',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscure: true,
              ),
              const SizedBox(height: 24),

              // زرار "Sign Up"
              CustomButton(
                buttomname: 'Sign Up',
                textColor: Colors.white,
                backgroundColor: kPrimaryColor,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // التحقق من تطابق كلمة المرور
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }
                    // هنا هتحط الـ logic بتاع التسجيل
                    // لو التسجيل نجح، تنقل لـ HomeView
                    context.go(AppRouter.kHomeView);
                  }
                },
              ),
              const SizedBox(height: 16),

              // نص "Already have an account? Login"
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Styles.textStyle14.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: Styles.textStyle14.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // التنقل لشاشة تسجيل الدخول (Sign In)
                                context.go(AppRouter.kSignInView);
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
