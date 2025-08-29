import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/core/router/router_name.dart';
import 'package:space/feature/auth/screen/create_password_screen.dart';
import 'package:space/feature/auth/screen/enter_otp_screen.dart';
import 'package:space/feature/auth/screen/login.dart';
import 'package:space/feature/auth/screen/setusername_screen.dart';
import 'package:space/feature/auth/screen/signup_screen.dart';
import 'package:space/feature/auth/screen/splash_screen.dart';

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
    return Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    );
  },
);
