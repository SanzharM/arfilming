part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesEvent {}

class PopularMoviesFetchEvent extends PopularMoviesEvent {}

class PopularMoviesRefreshEvent extends PopularMoviesEvent {}
