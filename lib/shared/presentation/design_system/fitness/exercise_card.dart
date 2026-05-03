import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';
import '../base/app_card.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.name,
    required this.target,
    required this.icon,
    this.note,
    super.key,
  });

  final String name;
  final String target;
  final IconData icon;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: theme.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  target,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (note != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(note!, style: theme.textTheme.bodySmall),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
