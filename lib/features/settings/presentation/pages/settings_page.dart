// FILE: lib/features/settings/presentation/pages/settings_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/bloc/theme_bloc.dart';
import '../../../../core/theme/bloc/theme_event.dart';
import '../../../../core/theme/bloc/theme_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) => ListTile(
                title: const Text('Theme'),
                subtitle: Text(state.mode.toString().split('.').last),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => themeBloc.add(ChangeTheme(ThemeMode.light)),
                  child: const Text('Light'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => themeBloc.add(ChangeTheme(ThemeMode.dark)),
                  child: const Text('Dark'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => themeBloc.add(ChangeTheme(ThemeMode.system)),
                  child: const Text('System'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ListTile(
              title: Text('About'),
              subtitle: Text('Clean Architecture demo'),
            ),
          ],
        ),
      ),
    );
  }
}
