import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/functions/build_error_snack_bar.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/forget_password_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/verfiy_password_usecase.dart';
import 'package:hotel_app/features/Auth/presentation/manager/cubit/resendcubit_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/otp_cubit/cubit/otpcubit_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/widgets/custom_otp_widget.dart';

class EmailVerificationViewBody extends StatefulWidget {
  const EmailVerificationViewBody({super.key, required this.email});
  final String email;

  @override
  State<EmailVerificationViewBody> createState() =>
      _EmailVerificationViewBodyState();
}

class _EmailVerificationViewBodyState extends State<EmailVerificationViewBody> {
  final GlobalKey<CustomOtpWidgetState> otpKey =
      GlobalKey<CustomOtpWidgetState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomOtpWidget(key: otpKey),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t receive an OTP?'),
                    TextButton(
                      onPressed: () {
                        otpKey.currentState?.clearFields();
                        context.read<ResendcubitCubit>().excute(
                          usecase: getit<ForgetPasswordUsecase>(),
                          params: widget.email,
                        );
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  buttomname: 'Verify',
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  onTap: () {
                    final state = otpKey.currentState;
                    if (state != null) {
                      final otp = state.getOtp();
                      if (otp.length == 6 &&
                          otp.split('').every((digit) => digit != '')) {
                        context.read<OtpcubitCubit>().excute(
                          param1: widget.email,
                          param2: otp,
                          usecase: getit<VerfiyPasswordUsecase>(),
                        );
                      } else {
                        showErrorSnackBar(
                          context,
                          'Please enter a valid 6-digit OTP',
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 16.0),
                CustomButton(
                  buttomname: 'Cancel',
                  textColor: kPrimaryColor,
                  backgroundColor: Colors.white,
                  onTap: () => context.go(AppRouter.kSignInView),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
