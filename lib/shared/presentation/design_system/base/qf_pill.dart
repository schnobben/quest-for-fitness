import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

enum QfPillTone { forest, ember, sky, gold, rune, muted }

class QfPill extends StatelessWidget {
  const QfPill({
    required this.child,
    this.tone = QfPillTone.forest,
    this.icon,
    super.key,
  });

  final Widget child;
  final QfPillTone tone;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final (bg, border, fg) = _toneColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(color: fg, size: 11),
              child: icon!,
            ),
            const SizedBox(width: 5),
          ],
          DefaultTextStyle(
            style: TextStyle(
              color: fg,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.02 * 11,
              height: 1.2,
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  (Color, Color, Color) _toneColors() {
    return switch (tone) {
      QfPillTone.forest => (
        const Color(0x1A68D391),
        const Color(0x4068D391),
        AppColors.forest,
      ),
      QfPillTone.ember => (
        const Color(0x1AF6AD55),
        const Color(0x40F6AD55),
        AppColors.ember,
      ),
      QfPillTone.sky => (
        const Color(0x1A63B3ED),
        const Color(0x4063B3ED),
        AppColors.sky,
      ),
      QfPillTone.gold => (
        const Color(0x1AECC94B),
        const Color(0x40ECC94B),
        AppColors.gold,
      ),
      QfPillTone.rune => (
        const Color(0x14B79A55),
        const Color(0x40B79A55),
        AppColors.rune,
      ),
      QfPillTone.muted => (
        AppColors.surface2,
        AppColors.outlineSoft,
        AppColors.inkMute,
      ),
    };
  }
}
