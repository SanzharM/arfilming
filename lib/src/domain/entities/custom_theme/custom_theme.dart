import 'dart:convert';

import 'package:arfilming/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:flutter/painting.dart';

class CustomTheme {
  const CustomTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.hintColor,
    required this.successColor,
    required this.errorColor,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color hintColor;
  final Color successColor;
  final Color errorColor;

  static const CustomTheme defaultTheme = CustomTheme(
    primaryColor: AppColors.black,
    secondaryColor: AppColors.black,
    backgroundColor: AppColors.black,
    hintColor: AppColors.black,
    successColor: AppColors.black,
    errorColor: AppColors.black,
  );

  CustomTheme copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? hintColor,
    Color? successColor,
    Color? errorColor,
  }) {
    return CustomTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hintColor: hintColor ?? this.hintColor,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'primaryColor': primaryColor.value});
    result.addAll({'secondaryColor': secondaryColor.value});
    result.addAll({'backgroundColor': backgroundColor.value});
    result.addAll({'hintColor': hintColor.value});
    result.addAll({'successColor': successColor.value});
    result.addAll({'errorColor': errorColor.value});

    return result;
  }

  factory CustomTheme.fromMap(Map<String, dynamic> map) {
    return CustomTheme(
      primaryColor: Color(map['primaryColor']),
      secondaryColor: Color(map['secondaryColor']),
      backgroundColor: Color(map['backgroundColor']),
      hintColor: Color(map['hintColor']),
      successColor: Color(map['successColor']),
      errorColor: Color(map['errorColor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomTheme.fromJson(String source) => CustomTheme.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomTheme(primaryColor: $primaryColor, secondaryColor: $secondaryColor, backgroundColor: $backgroundColor, hintColor: $hintColor, successColor: $successColor, errorColor: $errorColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomTheme &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor &&
        other.backgroundColor == backgroundColor &&
        other.hintColor == hintColor &&
        other.successColor == successColor &&
        other.errorColor == errorColor;
  }

  @override
  int get hashCode {
    return primaryColor.hashCode ^
        secondaryColor.hashCode ^
        backgroundColor.hashCode ^
        hintColor.hashCode ^
        successColor.hashCode ^
        errorColor.hashCode;
  }
}
