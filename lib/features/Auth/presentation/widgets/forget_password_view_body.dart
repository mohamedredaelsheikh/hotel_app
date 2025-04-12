import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/utils/constants.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
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
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // زرار "Reset Password"
              CustomButton(
                buttomname: 'Reset Password',
                textColor: Colors.white,
                backgroundColor: kPrimaryColor,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // هنا هتحط الـ logic بتاع إرسال رابط إعادة تعيين كلمة المرور
                    // مثلاً باستخدام Firebase أو API
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset link sent to your email'),
                      ),
                    );
                    // رجّع المستخدم لشاشة SignInView
                    context.go(AppRouter.kResetPasswordView);
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
