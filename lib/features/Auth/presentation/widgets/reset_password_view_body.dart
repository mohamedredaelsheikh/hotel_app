import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';

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
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // هنا هتحط الـ logic بتاع إعادة تعيين كلمة المرور
                    // مثلاً باستخدام Firebase أو API
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password has been reset successfully'),
                      ),
                    );
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
