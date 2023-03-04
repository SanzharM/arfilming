import 'package:arfilming/src/core/l10n/l10n_service.dart';
import 'package:arfilming/src/domain/entities/movie/movie_entity.dart';
import 'package:arfilming/src/domain/repositories/movie/movie_repository.dart';
import 'package:arfilming/src/service_locator.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  void fetch() => add(PopularMoviesFetchEvent());
  void refresh() => add(PopularMoviesRefreshEvent());

  PopularMoviesBloc() : super(const PopularMoviesState()) {
    on<PopularMoviesFetchEvent>(_fetch);
    on<PopularMoviesRefreshEvent>(_refresh);
  }

  final _repository = sl<MovieRepository>();

  void _fetch(
    PopularMoviesFetchEvent event,
    Emitter<PopularMoviesState> emit,
  ) async {
    if (state.isLoading) return;
    if (state.page > 1 && !state.canLoadMore) return;

    emit(state.copyWith(isLoading: true));

    try {
      final response = await _repository.fetchPopular(
        page: state.page,
        language: 'EN',
      );
      if (response.isSuccess) {
        var items = List<MovieEntity>.from(state.movies);
        return emit(state.copyWith(
          isLoading: false,
          page: state.page + 1,
          total: response.movies?.total,
          movies: items..addAll(response.movies?.items ?? []),
        ));
      }
      return emit(state.copyWith(
        isLoading: false,
        error: response.error ?? L10n.current.somethingWentWrong,
      ));
    } catch (e) {
      debugPrint('PopularMoviesFetchEvent error: $e');
      emit(state.copyWith(
        isLoading: false,
        error: L10n.current.somethingWentWrong,
      ));
    }
  }

  void _refresh(
    PopularMoviesRefreshEvent event,
    Emitter<PopularMoviesState> emit,
  ) async {
    // emit(state.copyWith(isLoading: true));
  }
}
