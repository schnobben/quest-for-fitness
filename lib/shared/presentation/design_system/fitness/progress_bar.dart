import 'package:flutter/material.dart';

class FitnessProgressBar extends StatelessWidget {
  const FitnessProgressBar({
    required this.value,
    this.height = 10,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final double value;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clampedValue = value.clamp(0, 1).toDouble();

    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: LinearProgressIndicator(
        value: clampedValue,
        minHeight: height,
        backgroundColor:
            backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
        color: foregroundColor ?? theme.colorScheme.primary,
      ),
    );
  }
}
