import 'package:go_router/go_router.dart';
import 'package:hotel_app/features/onboarding/presentation/views/anboarding_view.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kOnBoardingView = '/OnBoardingView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),

      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => const SearchView(),
      // ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => const HomeView(),w
      // ),
    ],
  );
}
