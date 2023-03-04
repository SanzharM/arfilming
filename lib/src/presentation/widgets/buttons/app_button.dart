import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.textAlign = TextAlign.center,
    this.textStyle,
    this.maxLines = 1,
    this.withBorder = true,
    this.borderColor,
  });

  final String title;
  final void Function()? onPressed;
  final bool isLoading;

  /// [If null, value of 2.w will be used]
  final EdgeInsets? padding;

  final Color? backgroundColor;
  final Color? textColor;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final int maxLines;

  final bool withBorder;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: Utils.delayDuration,
        width: double.maxFinite,
        constraints: BoxConstraints(
          minHeight: 48.h,
          maxHeight: 48.h,
        ),
        padding: padding ?? EdgeInsets.all(2.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.hintColor,
          borderRadius: AppConstraints.borderRadius,
          border: withBorder
              ? Border.all(
                  color: borderColor ?? theme.hintColor,
                  width: 1.0,
                )
              : null,
        ),
        child: AnimatedSwitcher(
          duration: Utils.animationDuration,
          child: isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                    color: textColor,
                  ),
                )
              : Text(
                  title,
                  maxLines: maxLines,
                  textAlign: textAlign,
                  style: textStyle ??
                      theme.textTheme.titleLarge?.apply(
                        color: textColor ?? theme.colorScheme.background,
                      ),
                ),
        ),
      ),
    );
  }
}
