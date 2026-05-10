import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/repositories/repositories.dart';

class PetEvolutionDialog extends StatelessWidget {
  const PetEvolutionDialog({
    required this.fromStage,
    required this.toStage,
    super.key,
  });

  final int fromStage;
  final int toStage;

  static Future<void> show(
    BuildContext context, {
    required int fromStage,
    required int toStage,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          PetEvolutionDialog(fromStage: fromStage, toStage: toStage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stageName = stageNames[toStage.clamp(0, 4)];

    return Dialog(
      backgroundColor: AppColors.surface2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1.0),
              duration: const Duration(milliseconds: 420),
              curve: Curves.elasticOut,
              builder: (context, scale, child) =>
                  Transform.scale(scale: scale, child: child),
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.ember.withValues(alpha: 0.15),
                  border: Border.all(color: AppColors.ember, width: 2),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: AppColors.gold,
                  size: 36,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Evolution!',
              style: AppTheme.fantasyStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.gold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ember evolved into $stageName',
              textAlign: TextAlign.center,
              style: AppTheme.fantasyStyle(
                fontSize: 16,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Your companion grows stronger with every step of your journey.',
              textAlign: TextAlign.center,
              style: AppTheme.fantasyStyle(
                fontSize: 12,
                color: AppColors.inkMute,
                italic: true,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Onwards'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
