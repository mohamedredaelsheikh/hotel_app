import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/features/Auth/Domain/Entities/user_entity.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/log_out_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/login_usecase.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_state.dart';
import 'package:hotel_app/features/Auth/presentation/manager/auth_cubit/authlogin_cubit.dart';
import 'package:hotel_app/features/home/presentation/manager/cubit/dispaly_user_data_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DispalyUserDataCubit()..displayUser(),
          ),

          BlocProvider(create: (context) => AuthButtomCubit()),
        ],
        child: BlocListener<AuthButtomCubit, AuthButtomState>(
          listener: (context, state) {
            if (state is AuthButtomSuccessState) {
              context.read<AuthloginCubit>().logout();
              context.pushReplacement(AppRouter.kSignInView);
            }
          },
          child: Center(
            child: BlocBuilder<DispalyUserDataCubit, DispalyUserDataState>(
              builder: (context, state) {
                if (state is DispalyUserDataLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is DispalyUserDataLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _username(state.userEntity),
                      const SizedBox(height: 10),
                      _email(state.userEntity),
                      _logout(context),
                    ],
                  );
                }
                if (state is DispalyUserDataFailure) {
                  return Text(state.errormessage);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _username(UserEntity user) {
    return Text(
      user.userName,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
    );
  }

  Widget _email(UserEntity user) {
    return Text(
      user.email,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
    );
  }

  Widget _logout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: CustomButton(
        buttomname: 'Logout',
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,

        onTap: () {
          context.read<AuthButtomCubit>().excute(
            usecase: getit<LogoutUseCase>(),
          );
        },
      ),
    );
  }
}
