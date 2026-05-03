import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';

class SetLoggingRow extends StatelessWidget {
  const SetLoggingRow({
    required this.setLabel,
    required this.reps,
    required this.weight,
    required this.isComplete,
    super.key,
  });

  final String setLabel;
  final String reps;
  final String weight;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(minHeight: AppSpacing.minTapTarget),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text(setLabel, style: theme.textTheme.labelLarge),
          ),
          Expanded(child: Text(reps, textAlign: TextAlign.center)),
          Expanded(child: Text(weight, textAlign: TextAlign.center)),
          Icon(
            isComplete ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isComplete
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
