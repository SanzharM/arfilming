part of 'movie_datasource.dart';

class MovieResponse extends ApiResponse {
  final PaginatedModel<MovieEntity>? movies;

  const MovieResponse({
    this.movies,
    super.statusCode,
    super.response,
    super.error,
  });
}
