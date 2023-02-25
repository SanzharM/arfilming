import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      stretch: true,
      pinned: true,
      expandedHeight: 80.h,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.5,
        stretchModes: const [StretchMode.zoomBackground],
        titlePadding: EdgeInsets.symmetric(
          horizontal: AppConstraints.padding / 4,
        ),
        title: Text(
          title,
          style: context.theme.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
