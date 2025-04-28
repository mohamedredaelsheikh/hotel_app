import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/functions/build_error_snack_bar.dart';
import 'package:hotel_app/core/functions/valided_password.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/sign_up_usecase.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';

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
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
                obscure: false,
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
                obscure: _obscurePassword,
                validator: validatePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
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
                obscure: _obscureConfirmPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 24),

              // زرار "Sign Up"
              BlocProvider.value(
                value: context.read<AuthButtomCubit>(),
                child: CustomButton(
                  buttomname: 'Sign Up',
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  onTap: () {
                    {
                      if (_formKey.currentState!.validate() == false) {
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please Check Your Enter Data'),
                            ),
                          );
                        }
                      }

                      context.read<AuthButtomCubit>().excute(
                        usecase: getit<SignUpUsecase>(),
                        params: SignUpReqModel(
                          userName: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        ),
                      );
                      showErrorSnackBar(
                        context,
                        'Sign Up Successfully \n, please Check your email acount to activate your account',
                      );
                    }
                  },
                ),
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
