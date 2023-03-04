import 'package:arfilming/src/data/datasources/movie/movie_datasource.dart';

abstract class MovieRepository {
  Future<MovieResponse> fetchPopular({int page = 1, String? language});
}
