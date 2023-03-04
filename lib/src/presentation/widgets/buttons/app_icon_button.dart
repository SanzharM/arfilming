import 'package:arfilming/src/presentation/app_router.dart';
import 'package:flutter/cupertino.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.padding,
    required this.icon,
    this.onPressed,
  });

  /// [By default padding is zero]
  final EdgeInsets? padding;
  final Widget icon;
  final void Function()? onPressed;

  factory AppIconButton.close(BuildContext context, {void Function()? onPressed}) {
    return AppIconButton(
      icon: const Icon(CupertinoIcons.xmark),
      onPressed: onPressed ?? context.router.back,
    );
  }
  factory AppIconButton.back(BuildContext context, {void Function()? onPressed}) {
    return AppIconButton(
      icon: const Icon(CupertinoIcons.back),
      onPressed: onPressed ?? context.router.back,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      child: icon,
    );
  }
}
