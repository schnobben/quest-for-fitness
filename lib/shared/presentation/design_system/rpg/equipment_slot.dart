import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';

class EquipmentSlot extends StatelessWidget {
  const EquipmentSlot({
    required this.label,
    required this.icon,
    this.isEquipped = false,
    super.key,
  });

  final String label;
  final IconData icon;
  final bool isEquipped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isEquipped
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;

    return Container(
      constraints: const BoxConstraints(minWidth: 88, minHeight: 88),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(
          color: isEquipped
              ? theme.colorScheme.primary
              : theme.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: AppSpacing.sm),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
