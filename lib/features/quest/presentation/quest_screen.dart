import 'package:flutter/material.dart';

import '../../../shared/presentation/placeholder_feature_screen.dart';

class QuestScreen extends StatelessWidget {
  const QuestScreen({super.key});

  static const routeName = 'quest';
  static const routePath = '/quest';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderFeatureScreen(
      title: 'Quest',
      subtitle:
          'Adventurer, XP, achievements, pet, and expedition systems appear here.',
      icon: Icons.shield,
    );
  }
}
