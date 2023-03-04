import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:arfilming/src/core/l10n/l10n_service.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:arfilming/src/domain/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:arfilming/src/presentation/widgets/movie/movie_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesBloc, PopularMoviesState>(
      listener: (context, state) {},
      builder: (context, state) {
        final movies = state.movies;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(AppConstraints.padding / 2),
              child: Text(
                L10n.of(context).popular,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Flexible(
              child: AnimatedSwitcher(
                duration: Utils.animationDuration,
                child: state.isLoading && movies.isEmpty
                    ? Center(
                        child: CupertinoActivityIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : Container(
                        height: 300.h,
                        width: double.maxFinite,
                        constraints: BoxConstraints(
                          minHeight: 300.h,
                          maxHeight: 300.h,
                        ),
                        color: AppColors.red,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          separatorBuilder: (_, __) {
                            return SizedBox(width: AppConstraints.padding);
                          },
                          itemBuilder: (context, index) {
                            final movie = movies.elementAt(index);
                            return MovieWidget(movieEntity: movie);
                          },
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
