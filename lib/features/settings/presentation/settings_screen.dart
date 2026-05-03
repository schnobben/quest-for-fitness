import 'package:flutter/material.dart';

import '../../../shared/presentation/placeholder_feature_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = 'settings';
  static const routePath = '/settings';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderFeatureScreen(
      title: 'Settings',
      subtitle:
          'Profile, environment, export, and developer settings will be configured here.',
      icon: Icons.settings,
    );
  }
}
