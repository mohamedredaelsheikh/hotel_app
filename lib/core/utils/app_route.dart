import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/features/Auth/presentation/manager/auth_cubit/authlogin_cubit.dart';
import 'package:hotel_app/features/Auth/presentation/views/forget_password_view.dart';
import 'package:hotel_app/features/Auth/presentation/views/reset_password_view.dart';
import 'package:hotel_app/features/Auth/presentation/views/sign_in_view.dart';
import 'package:hotel_app/features/Auth/presentation/views/sign_up_view.dart';
import 'package:hotel_app/features/home/presentation/views/home_view.dart';
import 'package:hotel_app/features/onboarding/presentation/views/anboarding_view.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static const kOnBoardingView = '/OnBoardingView';
  static const kSearchView = '/searchView';
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kResetPasswordView = '/resetPasswordView';

  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kSignInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    ],
    redirect: (context, state) {
      final authState = context.read<AuthloginCubit>().state;

      if (authState is Authenticated) {
        return kHomeView;
      }
      return null;
    },
    debugLogDiagnostics: true,
  );
}
