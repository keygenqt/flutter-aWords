import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';

final appTheme = ThemeData(
  colorScheme: ThemeData().colorScheme.copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
      )
  ),
  /// Cursor color
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary, //thereby
  ),
  /// [TextFormField]
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: AppColors.backgroundLightGray,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary),
    ),
  ),

  /// [ElevatedButton]
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      minimumSize: const Size.fromHeight(50),
    ),
  ),

  /// [OutlinedButton]
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.secondary.withOpacity(0.4);
          } else {
            return AppColors.secondary;
          }
        }
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: AppColors.secondary.withOpacity(0.4));
          } else {
            return const BorderSide(color: AppColors.secondary);
          }
        }
      ),
    ),

    // style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    //   side: MaterialStateProperty.all(BorderSide(
    //     color: AppColors.blue,
    //   )),
    // ),)
  ),

  /// [Text]
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
