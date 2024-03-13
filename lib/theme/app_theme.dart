import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color baseColor = const Color(0xffffffff);
  static Color primaryColor = const Color(0xff672CBC);
  static Color textColor = const Color(0xff8789A3);

  static TextStyle textStyle(
      {double fontSize = 14, Color? color, FontWeight? fontWeight}) {
    color ??= textColor;
    fontWeight ??= FontWeight.normal;
    return GoogleFonts.poppins(
        color: color, fontSize: fontSize, fontWeight: fontWeight);
  }
}
