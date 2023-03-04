import 'package:arfilming/src/presentation/widgets/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.actions = const [],
    this.title,
    this.titleStyle,
    this.needLeading = true,
    this.leading,
  });

  final bool automaticallyImplyLeading;
  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> actions;
  final bool needLeading;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: needLeading ? leading ?? AppIconButton.back(context) : null,
      title: title?.isNotEmpty ?? false
          ? Text(
              title!,
              style: titleStyle,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
