import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/presentation/auth/data/data_provider/auth_db.dart';
import 'package:track_it/presentation/auth/data/models/user.dart' as userModel;
import 'package:track_it/presentation/auth/presentation/screens/intro_page.dart';
import 'package:track_it/presentation/auth/presentation/screens/login_page.dart';
import 'package:track_it/presentation/auth/presentation/screens/signup_page.dart';
import 'package:track_it/presentation/auth/presentation/screens/splash_page.dart';
import 'package:track_it/presentation/home/analytics/presentation/analytics_page.dart';
import 'package:track_it/presentation/home/feeds/presentation/feeds_page.dart';
import 'package:track_it/presentation/home/home_page.dart';
import 'package:track_it/presentation/home/profile/presentation/profile_page.dart';

class RouterConstants {
  static const String home = 'home';
  static const String feedPage = 'feedPage';
  static const String analyticsPage = 'analyticsPage';
  static const String profilePage = 'profilePage';
  static const String splashPage = 'splashPage';
  static const String loginPage = 'loginPage';
  static const String signUpPage = 'signUpPage';
  static const String introPage = 'introPage';

  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();
}

final goRouterPaths = GoRouter(
    initialLocation: "/${RouterConstants.splashPage}",
    routes: [
      ShellRoute(
          navigatorKey: RouterConstants._shellNavigatorKey,
          builder: (context, state, child) {
            return HomePage(child: child);
          },
          routes: [
            GoRoute(
              name: RouterConstants.feedPage,
              path: "/${RouterConstants.home}/${RouterConstants.feedPage}",
              pageBuilder: (context, state) => const MaterialPage(
                child: FeedsPage(),
              ),
            ),
            GoRoute(
              name: RouterConstants.analyticsPage,
              path: "/${RouterConstants.home}/${RouterConstants.analyticsPage}",
              pageBuilder: (context, state) => const MaterialPage(
                child: AnalyticsPage(),
              ),
            ),
            GoRoute(
              name: RouterConstants.profilePage,
              path: "/${RouterConstants.home}/${RouterConstants.profilePage}",
              pageBuilder: (context, state) => const MaterialPage(
                child: ProfilePage(),
              ),
            ),
          ]),
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
