import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeCustom {
  TextThemeCustom._();

  static TextTheme appTextTheme(BuildContext context) {
    return TextTheme(
      // Headline
      headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // Title
      titleLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      titleSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // Body
      bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // Label
      labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
