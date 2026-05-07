import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class QfSectionHeader extends StatelessWidget {
  const QfSectionHeader({
    required this.title,
    this.moreLabel,
    this.onMoreTapped,
    super.key,
  });

  final String title;
  final String? moreLabel;
  final VoidCallback? onMoreTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.inkMute,
                letterSpacing: 0.1 * 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (moreLabel != null)
            GestureDetector(
              onTap: onMoreTapped,
              child: Text(
                moreLabel!,
                style: const TextStyle(fontSize: 12, color: AppColors.inkDim),
              ),
            ),
        ],
      ),
    );
  }
}
