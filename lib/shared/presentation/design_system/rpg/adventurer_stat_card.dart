import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';
import '../base/app_card.dart';

class AdventurerStatCard extends StatelessWidget {
  const AdventurerStatCard({
    required this.statName,
    required this.value,
    required this.icon,
    required this.color,
    super.key,
  });

  final String statName;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(statName, style: theme.textTheme.labelLarge)),
          Text(value, style: theme.textTheme.titleLarge),
        ],
      ),
    );
  }
}
