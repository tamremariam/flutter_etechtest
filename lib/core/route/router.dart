import 'package:etechtest/features/authentication/presentation/pages/login_page.dart';
import 'package:etechtest/features/authentication/presentation/pages/password_recovery_page.dart';
import 'package:etechtest/features/authentication/presentation/pages/reset_password_page.dart';
import 'package:etechtest/features/authentication/presentation/pages/signup_page.dart';
import 'package:etechtest/features/authentication/presentation/pages/verification_code_page.dart';
import 'package:etechtest/features/home/presentation/landing_page.dart';
import 'package:etechtest/features/home/presentation/search/searchscreen_page.dart';
import 'package:etechtest/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return
            // DistancePriferencePage();
            const SearchscreenPage();
        // const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'onboarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupPage();
          },
        ),
        GoRoute(
          path: 'landing',
          builder: (BuildContext context, GoRouterState state) {
            return const LandingPage();
          },
        ),
        GoRoute(
          path: 'verifycode',
          builder: (BuildContext context, GoRouterState state) {
            return const VerificationCodePage();
          },
        ),
        GoRoute(
          path: 'passwordrecovery',
          builder: (BuildContext context, GoRouterState state) {
            return const PasswordRecoveryPage();
          },
        ),
        GoRoute(
          path: 'resetpassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordPage();
          },
        ),
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchscreenPage();
          },
        ),
      ],
    ),
  ]);
}
