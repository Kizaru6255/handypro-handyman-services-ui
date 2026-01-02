import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App text styles
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get headline1 => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        height: 1.2,
      );

  static TextStyle get headline2 => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        height: 1.3,
      );

  static TextStyle get headline3 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  static TextStyle get headline4 => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.4,
      );

  static TextStyle get button => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.2,
      );

  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.3,
      );

  static TextStyle get overline => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.2,
        letterSpacing: 1.5,
      );
}


