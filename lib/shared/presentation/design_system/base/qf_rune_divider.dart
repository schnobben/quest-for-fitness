import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/theme/app_colors.dart';

class QfRuneDivider extends StatelessWidget {
  const QfRuneDivider({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 4),
      child: Row(
        children: [
          Expanded(child: _line(alignRight: false)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: GoogleFonts.fraunces(
                fontSize: 10.5,
                color: AppColors.rune,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.18 * 10.5,
                height: 1.2,
              ),
            ),
          ),
          Expanded(child: _line(alignRight: true)),
        ],
      ),
    );
  }

  Widget _line({required bool alignRight}) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: alignRight ? Alignment.centerLeft : Alignment.centerRight,
          end: alignRight ? Alignment.centerRight : Alignment.centerLeft,
          colors: [
            Colors.transparent,
            AppColors.rune.withValues(alpha: 0.35),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
