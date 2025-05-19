import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/utils/styles.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/customtextfield.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/forget_password_usecase.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';

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
              const SizedBox(height: 40),

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
              BlocProvider.value(
                value: context.read<AuthButtomCubit>(),
                child: CustomButton(
                  buttomname: 'Reset Password',
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthButtomCubit>().excute(
                        usecase: getit<ForgetPasswordUsecase>(),
                        params: emailController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Password reset link sent to your email',
                          ),
                        ),
                      );
                      // رجّع المستخدم لشاشة SignInView
                      context.go(
                        AppRouter.kEmailVerificationView,
                        extra: emailController.text,
                      );
                    }
                  },
                ),
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
