import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';
import '../base/app_card.dart';
import '../fitness/progress_bar.dart';

class PetStatusCard extends StatelessWidget {
  const PetStatusCard({
    required this.name,
    required this.mood,
    required this.bondProgress,
    super.key,
  });

  final String name;
  final String mood;
  final double bondProgress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.pets, color: theme.colorScheme.secondary),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: Text(name, style: theme.textTheme.titleMedium)),
              Text(mood, style: theme.textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Bond',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          FitnessProgressBar(
            value: bondProgress,
            foregroundColor: theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
