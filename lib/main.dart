
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),
        BlocProvider<ThemeBloc>(create: (_) => di.sl<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          final authBloc = context.read<AuthBloc>();
          final router = AppRouter(authBloc).router;
          final brightness = themeState.mode == ThemeMode.dark
              ? Brightness.dark
              : (themeState.mode == ThemeMode.light
              ? Brightness.light
              : MediaQueryData.fromView(WidgetsBinding.instance.window)
              .platformBrightness);
          final isDark = brightness == Brightness.dark;
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
              systemNavigationBarColor:
              isDark ? Colors.black : Colors.white,
              systemNavigationBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
            ),
          );
          return MaterialApp.router(
            title: 'Space App',
            themeMode: themeState.mode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
