import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Theme Configuration with Dark Mode and Neon Accents
class AppTheme {
  // Primary Colors
  static const Color primaryBlack = Color(0xFF0A0E27);
  static const Color darkBlack = Color(0xFF0F1219);
  static const Color surfaceBlack = Color(0xFF1A1F33);

  // Neon Accents
  static const Color neonPurple = Color(0xFFBB86FC);
  static const Color neonCyan = Color(0xFF00D4FF);
  static const Color neonPink = Color(0xFFFF006E);
  static const Color neonGreen = Color(0xFF00FF88);

  // Neutral Colors
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFFB0B0B0);
  static const Color borderGrey = Color(0xFF2A2F47);

  // Status Colors
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFE53935);
  static const Color warningOrange = Color(0xFFFFA726);

  /// Dark Theme Configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryBlack,
      primaryColor: neonPurple,
      canvasColor: surfaceBlack,
      dialogBackgroundColor: surfaceBlack,
      
      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: primaryBlack,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textWhite,
        ),
        centerTitle: true,
      ),

      // Text Themes
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textWhite,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textWhite,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textWhite,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textWhite,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textWhite,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textWhite,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textWhite,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textGrey,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textWhite,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textGrey,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: textGrey,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonPurple,
          foregroundColor: textWhite,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: neonCyan,
          side: const BorderSide(color: neonCyan, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceBlack,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: neonCyan, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorRed),
        ),
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: textGrey,
        ),
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: textGrey,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: surfaceBlack,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: borderGrey, width: 0.5),
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: borderGrey,
        thickness: 0.5,
        space: 1,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: textWhite,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: surfaceBlack,
        disabledColor: Colors.grey.withOpacity(0.3),
        selectedColor: neonPurple,
        secondarySelectedColor: neonCyan,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: textWhite,
        ),
        secondaryLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: textWhite,
        ),
        brightness: Brightness.dark,
        side: const BorderSide(color: borderGrey),
      ),
    );
  }
}
