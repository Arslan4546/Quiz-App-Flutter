import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors - Professional color palette
  static const Color primaryColorLight = Color(0xFF3F51B5); // Indigo
  static const Color primaryColorDark = Color(0xFF5C6BC0); // Lighter Indigo
  static const Color secondaryColorLight = Color(0xFF00BCD4); // Cyan
  static const Color secondaryColorDark = Color(0xFF26C6DA); // Lighter Cyan
  static const Color accentColorLight = Color(0xFFFF9800); // Orange
  static const Color accentColorDark = Color(0xFFFFB74D); // Lighter Orange
  static const Color backgroundColorLight = Color(0xFFF8F9FA); // Light Gray
  static const Color backgroundColorDark = Color(0xFF121212); // Dark Gray
  static const Color cardColorLight = Colors.white;
  static const Color cardColorDark = Color(0xFF1E1E1E);
  static const Color textColorLight = Color(0xFF212121); // Near Black
  static const Color textColorDark = Color(0xFFECEFF1); // Off White
  static const Color correctAnswerColor = Color(0xFF4CAF50); // Green
  static const Color wrongAnswerColor = Color(0xFFF44336); // Red
  static const Color timerWarningColor = Color(0xFFFF9800); // Orange
  
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColorLight,
    scaffoldBackgroundColor: backgroundColorLight,
    cardColor: cardColorLight,
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      secondary: secondaryColorLight,
      tertiary: accentColorLight,
      surface: cardColorLight,
      background: backgroundColorLight,
      error: wrongAnswerColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textColorLight,
      onBackground: textColorLight,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColorLight,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColorLight,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColorLight,
        side: const BorderSide(color: primaryColorLight, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      shadowColor: primaryColorLight.withOpacity(0.3),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w700, fontSize: 32),
      displayMedium: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w700, fontSize: 28),
      displaySmall: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w700, fontSize: 24),
      headlineMedium: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w600, fontSize: 20),
      headlineSmall: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w600, fontSize: 18),
      titleLarge: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w600, fontSize: 16),
      bodyLarge: GoogleFonts.poppins(color: textColorLight, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: textColorLight, fontSize: 14),
      labelLarge: GoogleFonts.poppins(color: textColorLight, fontWeight: FontWeight.w600, fontSize: 14),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
      thickness: 1,
      space: 24,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    scaffoldBackgroundColor: backgroundColorDark,
    cardColor: cardColorDark,
    colorScheme: const ColorScheme.dark(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
      tertiary: accentColorDark,
      surface: cardColorDark,
      background: backgroundColorDark,
      error: wrongAnswerColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textColorDark,
      onBackground: textColorDark,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: cardColorDark,
      foregroundColor: textColorDark,
      elevation: 2,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColorDark,
      ),
      iconTheme: IconThemeData(color: textColorDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColorDark,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColorDark,
        side: const BorderSide(color: primaryColorDark, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      shadowColor: primaryColorDark.withOpacity(0.3),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w700, fontSize: 32),
      displayMedium: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w700, fontSize: 28),
      displaySmall: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w700, fontSize: 24),
      headlineMedium: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w600, fontSize: 20),
      headlineSmall: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w600, fontSize: 18),
      titleLarge: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w600, fontSize: 16),
      bodyLarge: GoogleFonts.poppins(color: textColorDark, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: textColorDark, fontSize: 14),
      labelLarge: GoogleFonts.poppins(color: textColorDark, fontWeight: FontWeight.w600, fontSize: 14),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white24,
      thickness: 1,
      space: 24,
    ),
  );
}