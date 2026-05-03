import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/theme/app_colors.dart';

class QfScreenHeader extends StatelessWidget {
  const QfScreenHeader({
    required this.title,
    this.salutation,
    this.trailing,
    super.key,
  });

  final String title;
  final String? salutation;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (salutation != null)
                  Text(
                    salutation!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.inkDim,
                      letterSpacing: 0.04 * 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                Text(
                  title,
                  style: GoogleFonts.fraunces(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                    height: 1.2,
                    letterSpacing: -0.01 * 22,
                  ),
                ),
              ],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
