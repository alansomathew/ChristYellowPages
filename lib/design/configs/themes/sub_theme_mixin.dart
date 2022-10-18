import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './app_colors.dart';

mixin SubTheme {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
      
        bodyText1: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(
      color: onSurfaceTextColor,
      size: 16,
    );
  }
}
