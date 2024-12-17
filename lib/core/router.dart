import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/presentation/auth/presentation/screens/intro_page.dart';
import 'package:track_it/presentation/auth/presentation/screens/login_page.dart';
import 'package:track_it/presentation/auth/presentation/screens/signup_page.dart';
import 'package:track_it/presentation/auth/presentation/screens/splash_page.dart';
import 'package:track_it/presentation/home/home_page.dart';

class RouterConstants {
  static const String home = 'home';
  static const String splashPage = 'splashPage';
  static const String loginPage = 'loginPage';
  static const String signUpPage = 'signUpPage';
  static const String introPage = 'introPage';
}

final goRouterPaths = GoRouter(
    initialLocation: "/${RouterConstants.splashPage}",
    routes: [
      GoRoute(
        name: RouterConstants.home,
        path: "/${RouterConstants.home}",
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
        ),
      ),
      GoRoute(
        name: RouterConstants.splashPage,
        path: "/${RouterConstants.splashPage}",
        pageBuilder: (context, state) => const MaterialPage(
          child: SpalshPage(),
        ),
      ),
      GoRoute(
        name: RouterConstants.loginPage,
        path: "/${RouterConstants.loginPage}",
        pageBuilder: (context, state) => MaterialPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: RouterConstants.signUpPage,
        path: "/${RouterConstants.signUpPage}",
        pageBuilder: (context, state) => MaterialPage(
          child: SignUpPage(),
        ),
      ),
      GoRoute(
        name: RouterConstants.introPage,
        path: "/${RouterConstants.introPage}",
        pageBuilder: (context, state) => MaterialPage(
          child: IntroPages(),
        ),
      ),
    ],
    errorBuilder: (context, state) {
      return const ErrorPage();
    });

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
