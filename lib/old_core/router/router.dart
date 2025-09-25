import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/old_core/router/router_name.dart';

import '../../old_feature/auth/screen/create_password_screen.dart';
import '../../old_feature/auth/screen/enter_otp_screen.dart';
import '../../old_feature/auth/screen/login.dart';
import '../../old_feature/auth/screen/setusername_screen.dart';
import '../../old_feature/auth/screen/signup_screen.dart';
import '../../old_feature/auth/screen/splash_screen.dart';

/// Router configuration
final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: RouteNames.LoginScreen,
      path: Routes.LoginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RouteNames.SignUpScreen,
      path: Routes.SignUpScreen,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: RouteNames.SetUserNameScreen,
      path: Routes.SetUserNameScreen,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      name: RouteNames.CreatePasswordScreen,
      path: Routes.CreatePasswordScreen,
      builder: (context, state) => const CreatePasswordScreen(),
    ),
    GoRoute(
      name: RouteNames.EnterOtpScreen,
      path: Routes.EnterOtpScreen,
      builder: (context, state) => const OtpScreen(),
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Error: ${state.error}')));
  },
);
