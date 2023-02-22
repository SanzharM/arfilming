import 'package:arfilming/src/core/flutter_gen/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const String fontFamily = AppFonts.raleway;

  static TextTheme theme() => const TextTheme(
        // Display
        displaySmall: displaySmall,
        displayMedium: displayMedium,
        displayLarge: displayLarge,

        // Body
        bodySmall: bodySmall,
        bodyMedium: bodyMedium,
        bodyLarge: bodyLarge,

        // Title
        titleSmall: titleSmall,
        titleMedium: titleMedium,
        titleLarge: titleLarge,

        // Headline
        headlineSmall: headlineSmall,
        headlineMedium: headlineMedium,
        headlineLarge: headlineLarge,
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
