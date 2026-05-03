import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

class AppTheme {
  AppTheme._();

  // Fantasy serif — used for quest titles, screen headings, RPG moments
  static TextStyle fantasyStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    bool italic = false,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.fraunces(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Monospace — numbers, weights, reps, times
  static TextStyle monoStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  static ThemeData dark() {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.forest,
      onPrimary: AppColors.bgDeep,
      primaryContainer: AppColors.forestDark,
      onPrimaryContainer: AppColors.forest,
      secondary: AppColors.ember,
      onSecondary: AppColors.bgDeep,
      secondaryContainer: Color(0xFF3D2A10),
      onSecondaryContainer: AppColors.ember,
      tertiary: AppColors.sky,
      onTertiary: AppColors.bgDeep,
      error: AppColors.rose,
      onError: AppColors.bgDeep,
      surface: AppColors.surface,
      onSurface: AppColors.ink,
      surfaceContainerHighest: AppColors.raised,
      onSurfaceVariant: AppColors.inkMute,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineSoft,
      shadow: Colors.black,
      scrim: Colors.black,
    );

    final textTheme = _buildTextTheme(isDark: true);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.bg,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.bg,
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          side: const BorderSide(color: AppColors.outlineSoft),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xD6080C0A),
        elevation: 0,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.forest, size: 22);
          }
          return const IconThemeData(color: AppColors.inkDim, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.interTight(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.forest,
            );
          }
          return GoogleFonts.interTight(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.inkDim,
          );
        }),
        height: 64,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.forest,
          foregroundColor: AppColors.bgDeep,
          minimumSize: const Size.fromHeight(AppSpacing.minTapTarget),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.interTight(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.16,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          backgroundColor: AppColors.surface2,
          minimumSize: const Size.fromHeight(44),
          side: const BorderSide(color: AppColors.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: GoogleFonts.interTight(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          borderSide: const BorderSide(color: AppColors.forest, width: 1.5),
        ),
        labelStyle: const TextStyle(color: AppColors.inkDim),
        hintStyle: const TextStyle(color: AppColors.inkFaint),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineSoft,
        space: 1,
        thickness: 1,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.forest;
          return AppColors.surface3;
        }),
        checkColor: WidgetStateProperty.all(AppColors.bgDeep),
        side: const BorderSide(color: AppColors.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.raised,
        contentTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.forest,
        linearTrackColor: AppColors.surface3,
      ),
    );
  }

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.forest,
      brightness: Brightness.light,
    ).copyWith(surface: AppColors.lightSurface);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(isDark: false),
    );
  }

  static TextTheme _buildTextTheme({required bool isDark}) {
    final ink = isDark ? AppColors.ink : Colors.black87;
    final inkMute = isDark ? AppColors.inkMute : Colors.black54;

    return TextTheme(
      displayLarge: GoogleFonts.interTight(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1.05,
        color: ink,
        letterSpacing: -0.5,
      ),
      headlineLarge: GoogleFonts.interTight(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: ink,
        letterSpacing: -0.3,
      ),
      headlineMedium: GoogleFonts.interTight(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.15,
        color: ink,
        letterSpacing: -0.2,
      ),
      headlineSmall: GoogleFonts.interTight(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: ink,
        letterSpacing: -0.1,
      ),
      titleLarge: GoogleFonts.interTight(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.25,
        color: ink,
      ),
      titleMedium: GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.3,
        color: ink,
      ),
      titleSmall: GoogleFonts.interTight(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.3,
        color: ink,
      ),
      bodyLarge: GoogleFonts.interTight(
        fontSize: 16,
        height: 1.45,
        color: ink,
      ),
      bodyMedium: GoogleFonts.interTight(
        fontSize: 14,
        height: 1.4,
        color: ink,
      ),
      bodySmall: GoogleFonts.interTight(
        fontSize: 12,
        height: 1.4,
        color: inkMute,
      ),
      labelLarge: GoogleFonts.interTight(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: ink,
      ),
      labelMedium: GoogleFonts.interTight(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: ink,
      ),
      labelSmall: GoogleFonts.interTight(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: inkMute,
      ),
    );
  }
}
