import 'package:arfilming/src/data/datasources/movie/movie_datasource.dart';
import 'package:arfilming/src/domain/repositories/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;

  const MovieRepositoryImpl(this.datasource);

  @override
  Future<MovieResponse> fetchPopular({int page = 1, String? language}) {
    return datasource.fetchPopular(page: page, language: language);
  }
}
