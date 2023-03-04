import 'package:arfilming/src/core/api/api.dart';
import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/domain/entities/movie/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.movieEntity,
  });

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        height: double.maxFinite,
        width: 60.w,
        alignment: Alignment.center,
        padding: EdgeInsets.all(2.w),
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: AppConstraints.borderRadius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: AppConstraints.borderRadius,
              child: CachedNetworkImage(
                imageUrl: ApiEndpoints.imageHost + (movieEntity.posterPath ?? ''),
                fit: BoxFit.cover,
                height: 210.h,
                width: double.maxFinite,
                errorWidget: (_, __, ___) {
                  return Container(
                    alignment: Alignment.center,
                    child: const Icon(
                      CupertinoIcons.question_circle,
                      size: 24.0,
                    ),
                  );
                },
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  movieEntity.title ?? movieEntity.originalTitle ?? '',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.apply(
                    color: theme.hintColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
