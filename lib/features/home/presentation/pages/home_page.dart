import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/theme/bloc/theme_bloc.dart';
import '../../../../core/theme/bloc/theme_event.dart';
import '../../../auth/domain/presentation/bloc/auth_bloc.dart';
import '../../../auth/domain/presentation/bloc/auth_event.dart';
import '../../../auth/domain/presentation/bloc/auth_state.dart';


class HomePage extends StatelessWidget { const HomePage({super.key});
@override Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Home'), actions: [
      IconButton(icon: const Icon(Icons.brightness_6), onPressed: () => context.read<ThemeBloc>().add(ToggleTheme())),
      IconButton(icon: const Icon(Icons.settings), onPressed: () => context.push('/settings')),
    ]),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      BlocSelector<AuthBloc, AuthState, String?>(selector: (s) => s is AuthAuthenticated ? s.user.name : null, builder: (ctx, name) => Text('Welcome, ${name ?? 'Guest'}', style: const TextStyle(fontSize: 20))),
      const SizedBox(height: 20),
      ElevatedButton(onPressed: () { context.read<AuthBloc>().add(LogoutRequested()); context.go('/login'); }, child: const Text('Logout'))
    ])),
  );
}
}
