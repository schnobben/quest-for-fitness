import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

abstract final class QfNotification {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.surface3,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.outline),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
