import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigzek_user/constants/color_palettes.dart';

class AppTextThemes {
  static TextTheme get darkTextTheme {
    return TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ColorPalettes.primaryTextColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorPalettes.primaryTextColor,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorPalettes.primaryTextColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorPalettes.primaryTextColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorPalettes.primaryTextColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: ColorPalettes.primaryTextColor,
      ),
    );
  }
}
