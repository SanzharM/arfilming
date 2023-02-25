import 'package:arfilming/src/core/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  void fetch(int id) => add(MovieDetailFetchEvent(id));

  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailFetchEvent>(_fetch);
  }

  void _fetch(MovieDetailFetchEvent event, Emitter<MovieDetailState> emit) async {
    await Api().request(
      uri: Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.movieDetails(event.id)),
      method: Method.get,
    );
  }
}
