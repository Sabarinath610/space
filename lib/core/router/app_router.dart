import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/auth/domain/presentation/bloc/auth_bloc.dart';
import '../../features/auth/domain/presentation/bloc/auth_state.dart';
import '../../features/auth/domain/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import 'go_router_refresh_stream.dart';

class AppRouter {
  late final GoRouter router;
  AppRouter(AuthBloc authBloc) {
    router = GoRouter(
      initialLocation: '/home',
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final isLoggedIn = authBloc.state is AuthAuthenticated;
        final loggingIn = state.path == '/home';
        if (!isLoggedIn && !loggingIn) return '/home';
        if (isLoggedIn && loggingIn) return '/home';
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (ctx, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (ctx, state) => const HomePage(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (ctx, state) => const SettingsPage(),
        ),
      ],
      errorBuilder: (ctx, state) =>
          Scaffold(body: Center(child: Text(state.error.toString()))),
    );
  }
}
