import 'dart:convert';
import 'dart:typed_data';

import 'package:arfilming/src/core/api/api.dart';
import 'package:arfilming/src/data/models/paginated_model.dart';
import 'package:arfilming/src/domain/entities/movie/movie_entity.dart';

part 'movie_response.dart';

abstract class MovieDatasource {
  Future<MovieResponse> fetchPopular({int page = 1, String? language});
}

class MovieDatasourceImpl implements MovieDatasource {
  final Api _api;

  const MovieDatasourceImpl(this._api);

  @override
  Future<MovieResponse> fetchPopular({int page = 1, String? language}) async {
    final response = await _api.request(
      uri: Uri.https(
        ApiEndpoints.host,
        ApiEndpoints.popularMovies,
        {'page': page.toString(), 'language': language ?? 'en-US'},
      ),
      method: Method.get,
    );
    return MovieResponse(
      statusCode: response.statusCode,
      response: response.response,
      movies: response.isSuccess ? parseMovies(response.response?.bodyBytes) : null,
      error: response.error,
    );
  }

  static PaginatedModel<MovieEntity>? parseMovies(Uint8List? bodyBytes) {
    if (bodyBytes?.isEmpty ?? true) return null;
    final data = jsonDecode(utf8.decode(bodyBytes!)) as Map<String, dynamic>;

    final results = (data['results'] as List?)?.map((e) => MovieEntity.fromMap(e)).toList();
    return PaginatedModel<MovieEntity>(
      items: results ?? [],
      page: int.tryParse('${data['page']}'),
      total: int.tryParse('${data['total_results']}'),
    );
  }
}
