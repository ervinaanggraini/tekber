import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF5A52E8);
  static const Color primaryLight = Color(0xFF8B84FF);

  static const Color background = Color(0xFF1A1A2E);
  static const Color cardBackground = Color(0xFF16213E);
  static const Color surfaceLight = Color(0xFF0F3460);

  static const Color accent = Color(0xFFE94560);
  static const Color accentLight = Color(0xFFFF6B88);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B3C1);
  static const Color textTertiary = Color(0xFF7A7D8A);

  static const Color iconPrimary = Color(0xFFFFFFFF);
  static const Color iconSecondary = Color(0xFF8E92A8);

  static const Color success = Color(0xFF00D9A3);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFEF5350);
  static const Color info = Color(0xFF42A5F5);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF8B84FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF16213E), Color(0xFF0F3460)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFE94560), Color(0xFFFF6B88)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);

  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);

  static const Color border = Color(0xFF2A2F4F);
  static const Color borderLight = Color(0xFF3A3F5F);

  static const Color transparent = Colors.transparent;

  static Color withAlpha(Color color, double opacity) {
    final int a = (opacity.clamp(0.0, 1.0) * 255).round();
    return color.withAlpha(a);
  }
}
