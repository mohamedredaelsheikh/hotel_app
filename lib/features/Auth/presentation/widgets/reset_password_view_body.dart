import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/resset_password_usecase.dart';
import 'package:hotel_app/features/Auth/data/models/ressetpasswordmodel.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> data =
        GoRouterState.of(context).extra as Map<String, String>;
    final email = data['email']!;
    final token = data['token']!;
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
              const SizedBox(height: 40), // مسافة عشان الحقول متتراكمش تحت النص
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

              // حقل الـ New Password (Confirm Password)
              Text(
                'New Password',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormTextField(
                controller: passwordController,
                hintText: 'New Password',
                obscure: true,
              ),

              const SizedBox(height: 24),

              // زرار "Continue"
              CustomButton(
                buttomname: 'Continue',
                textColor: Colors.white,
                backgroundColor: kPrimaryColor,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthButtomCubit>().excute(
                      usecase: getit<RessetPasswordUsecase>(),
                      params: Ressetpasswordmodel(
                        email: email,
                        token: token,
                        newPassword: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password has been reset successfully'),
                      ),
                    );
                    if (!mounted) return;
                    // رجّع المستخدم لشاشة SignInView
                    context.go(AppRouter.kSignInView);
                  }
                },
              ),
              const SizedBox(height: 16),

              // زرار "Cancel"
              CustomButton(
                buttomname: 'Cancel',
                textColor: kPrimaryColor,
                backgroundColor: Colors.white,

                onTap: () {
                  // رجّع المستخدم لشاشة SignInView
                  context.go(AppRouter.kSignInView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
