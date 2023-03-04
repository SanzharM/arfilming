part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {
  final List<MovieEntity> movies;
  final bool isLoading;
  final int page;
  final int total;
  final String error;

  const PopularMoviesState({
    this.movies = const [],
    this.isLoading = false,
    this.page = 1,
    this.total = 0,
    this.error = '',
  });

  @override
  List<Object> get props => [movies, isLoading, page, total, error];

  bool get canLoadMore {
    return movies.length < total;
  }

  PopularMoviesState copyWith({
    List<MovieEntity>? movies,
    bool? isLoading,
    int? page,
    int? total,
    String? error,
  }) {
    return PopularMoviesState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      total: total ?? this.total,
      error: error ?? '',
    );
  }
}
