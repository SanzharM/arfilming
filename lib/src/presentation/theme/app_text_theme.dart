import 'package:arfilming/src/core/flutter_gen/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const String fontFamily = AppFonts.raleway;

  static TextTheme theme(Color? color) => TextTheme(
        // Display
        displaySmall: displaySmall.apply(color: color),
        displayMedium: displayMedium.apply(color: color),
        displayLarge: displayLarge.apply(color: color),

        // Body
        bodySmall: bodySmall.apply(color: color),
        bodyMedium: bodyMedium.apply(color: color),
        bodyLarge: bodyLarge.apply(color: color),

        // Title
        titleSmall: titleSmall.apply(color: color),
        titleMedium: titleMedium.apply(color: color),
        titleLarge: titleLarge.apply(color: color),

        // Headline
        headlineSmall: headlineSmall.apply(color: color),
        headlineMedium: headlineMedium.apply(color: color),
        headlineLarge: headlineLarge.apply(color: color),
      );

  // -------------------------------- DISPLAY --------------------------------
  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 9,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  // -------------------------------- LABEL --------------------------------
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  // -------------------------------- BODY --------------------------------
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  // -------------------------------- TITLE --------------------------------
  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // -------------------------------- HEADLINE --------------------------------
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );
}
