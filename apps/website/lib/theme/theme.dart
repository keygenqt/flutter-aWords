import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/theme/colors.dart';

final appTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.ubuntu(
      fontSize: 60,
      color: AppColors.fontPrimary,
    ),
    headlineMedium: GoogleFonts.ubuntu(
      fontSize: 46,
      color: AppColors.fontPrimary,
    ),
    headlineSmall: GoogleFonts.ubuntu(
      fontSize: 36,
      color: AppColors.fontPrimary,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntu(
      fontSize: 30,
      color: AppColors.fontPrimary,
    ),
    titleMedium: GoogleFonts.ubuntu(
      fontSize: 24,
      color: AppColors.fontPrimary,
    ),
    titleSmall: GoogleFonts.ubuntu(
      fontSize: 18,
      color: AppColors.fontPrimary,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.ubuntu(
      fontSize: 18,
      color: AppColors.fontPrimary,
    ),
    bodyMedium: GoogleFonts.ubuntu(
      fontSize: 16,
      color: AppColors.fontPrimary,
    ),
    bodySmall: GoogleFonts.ubuntu(
      fontSize: 14,
      color: AppColors.fontPrimary,
    ),
  ),
);
