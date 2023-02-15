import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/theme/colors.dart';

final appTheme = ThemeData(
  textTheme: TextTheme(
    titleLarge: GoogleFonts.ubuntu(
      fontSize: 36,
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
