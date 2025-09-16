// FILE: lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart' as di;
import 'core/bloc_observer.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'core/theme/bloc/theme_state.dart';
import 'features/auth/domain/presentation/bloc/auth_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init(baseUrl: 'https://api.example.com');
  runApp(AppEntry());
}

class AppEntry extends StatelessWidget {
  AppEntry({super.key});
  final _router = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),
        BlocProvider<ThemeBloc>(create: (_) => di.sl<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'CleanApp',
            themeMode: themeState.mode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerDelegate: _router.routerDelegate,
            routeInformationParser: _router.routeInformationParser,
            routeInformationProvider: _router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
