import 'package:flutter/material.dart';

import '../../../shared/presentation/placeholder_feature_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  static const routeName = 'library';
  static const routePath = '/library';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderFeatureScreen(
      title: 'Library',
      subtitle:
          'Exercises, workouts, programs, campaigns, and templates are managed here.',
      icon: Icons.inventory_2,
    );
  }
}
