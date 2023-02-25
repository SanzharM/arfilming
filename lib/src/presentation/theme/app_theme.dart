import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:arfilming/src/domain/entities/custom_theme/custom_theme.dart';
import 'package:arfilming/src/presentation/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static IconThemeData _iconThemeData(Color color) {
    return IconThemeData(
      size: 24.w,
      color: color,
    );
  }

  static ThemeData defaultTheme() {
    return buildThemeData(customTheme: CustomTheme.defaultTheme);
  }

  static ThemeData buildThemeData({
    required CustomTheme customTheme,
  }) {
    bool isDark = customTheme.themeMode == ThemeMode.dark;
    Brightness brightness = isDark ? Brightness.light : Brightness.dark;
    return ThemeData(
      scaffoldBackgroundColor: customTheme.backgroundColor,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
        backgroundColor: customTheme.backgroundColor,
        titleTextStyle: AppTextTheme.titleLarge.apply(
          color: customTheme.primaryColor,
        ),
        elevation: 0,
        iconTheme: _iconThemeData(customTheme.primaryColor),
      ),
      hintColor: customTheme.hintColor,
      highlightColor: customTheme.successColor,
      iconTheme: _iconThemeData(customTheme.primaryColor),
      textTheme: AppTextTheme.theme(customTheme.primaryColor),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        brightness: brightness,
        primaryColor: customTheme.primaryColor,
        scaffoldBackgroundColor: customTheme.backgroundColor,
        barBackgroundColor: AppColors.transparent,
        primaryContrastingColor: customTheme.secondaryColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: customTheme.primaryColor,
          actionTextStyle: AppTextTheme.titleMedium.apply(
            color: customTheme.primaryColor,
          ),
          textStyle: AppTextTheme.bodyMedium.apply(
            color: customTheme.primaryColor,
          ),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: customTheme.primaryColor,
        onPrimary: customTheme.primaryColor,
        secondary: customTheme.secondaryColor,
        onSecondary: customTheme.secondaryColor,
        background: customTheme.backgroundColor,
        onBackground: customTheme.backgroundColor,
        error: customTheme.errorColor,
        onError: customTheme.errorColor,
        surface: customTheme.hintColor,
        onSurface: customTheme.hintColor,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: customTheme.backgroundColor,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: AppConstraints.borderRadiusTLR,
        ),
        constraints: BoxConstraints(
          maxHeight: 706.h,
          minHeight: 150.h,
        ),
      ),
    );
  }
}
