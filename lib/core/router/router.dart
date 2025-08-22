import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/core/router/router_name.dart';
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
    
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    );
  },
);
