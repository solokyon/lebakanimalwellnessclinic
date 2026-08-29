import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const primary = Color(0xFFFF8500); // logo orange
  static const primaryDark = Color(0xFFD96F00);
  static const primaryLight = Color(0xFFFFB15C);

  // Neutrals
  static const black = Color(0xFF111111);
  static const white = Color(0xFFFFFFFF);

  // Backgrounds
  static const background = Color(0xFFF8F8F7);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceSoft = Color(0xFFF3F3F1);

  // Text
  static const textPrimary = Color(0xFF171717);
  static const textSecondary = Color(0xFF606060);
  static const textMuted = Color(0xFF969696);

  // Borders
  static const border = Color(0xFFE2E2E0);
  static const divider = Color(0xFFECECEA);

  // Semantic colors
  static const success = Color(0xFF3F8C65);
  static const warning = Color(0xFFE7A22B);
  static const error = Color(0xFFC94D45);
  static const info = Color(0xFF4E7F9E);

  // Appointment statuses
  static const scheduled = Color(0xFF4E7F9E);
  static const checkedIn = Color(0xFFFFA12E);
  static const inConsultation = Color(0xFF8A6DAA);
  static const completed = Color(0xFF3F8C65);
  static const cancelled = Color(0xFFC94D45);
  static const noShow = Color(0xFF777777);
}