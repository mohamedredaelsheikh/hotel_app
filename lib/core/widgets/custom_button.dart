import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_state.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttomname,
    required this.onTap,
    required this.backgroundColor,

    required this.textColor,
  });

  final String buttomname;
  final void Function()? onTap;
  final Color? backgroundColor;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthButtomCubit, AuthButtomState>(
      builder: (context, state) {
        if (state is AuthButtomLoadingState) {
          return _loadingButtom(context);
        } else {
          return _initialButtom(context);
        }
      },
    );
  }

  Widget _loadingButtom(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      width: double.infinity,
      height: 60,
      child: Center(
        child: const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  Widget _initialButtom(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kPrimaryColor, width: 2),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            buttomname,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
