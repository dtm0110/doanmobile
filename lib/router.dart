import 'package:flutter/material.dart';
import 'package:job_search/data/model/career.dart';
import 'package:job_search/features/filter/filter_view.dart';
import 'package:job_search/data/model/account.dart';
import 'package:job_search/features/main/main_view.dart';
import 'package:job_search/utility/custom_page_route.dart';

import 'data/model/filter_arguments.dart';
import 'features/authentication/login/login_view.dart';
import 'features/authentication/profile/editor/profile_editor_view.dart';
import 'features/authentication/profile/profile_view.dart';
import 'features/authentication/register/register_view.dart';
import 'features/home/home_view.dart';
import 'features/job/detail/job_view.dart';
import 'features/job/favorite/job_favorite_view.dart';
import 'features/job/filter/job_filter_view.dart';
import 'features/splash/splash_view.dart';

class AppRouter {
  static const splashScreen = SplashView.routeName;
  static const homeScreen = MainView.routeName;
  static const loginScreen = LoginView.routeName;
  static const registerScreen = RegisterView.routeName;
  static const jobScreen = JobView.routeName;
  static const jobFavoriteScreen = JobFavoriteView.routeName;
  static const jobFilterScreen = JobFilterView.routeName;
  static const profileScreen = ProfileView.routeName;
  static const profileEditorScreen = ProfileEditorView.routeName;
  static const filterScreen = FilterView.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.splashScreen:
        return UCRoute(
          const SplashView(),
          fade: true,
          duration: TransitionDuration.slow,
        );
      case AppRouter.homeScreen:
        return UCRoute(
          const MainView(),
        );
      case AppRouter.loginScreen:
        return UCRoute(
          const LoginView(),
          fade: true,
          duration: TransitionDuration.fast,
        );
      case AppRouter.registerScreen:
        return UCRoute(
          const RegisterView(),
        );
      case AppRouter.jobScreen:
        return UCRoute(
          JobView(
            job: settings.arguments as Career,
          ),
          fade: true,
          duration: TransitionDuration.fast,
        );
      case AppRouter.jobFavoriteScreen:
        return UCRoute(
          JobFavoriteView(),
        );
      case AppRouter.jobFilterScreen:
        return UCRoute(
          const JobFilterView(),
        );
      case AppRouter.profileScreen:
        return UCRoute(
          const ProfileView(),
        );
      case AppRouter.profileEditorScreen:
        return UCRoute(
          const ProfileEditorView(),
        );
      case AppRouter.filterScreen:
        return UCRoute(FilterView(settings.arguments as FilterArguments));

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
