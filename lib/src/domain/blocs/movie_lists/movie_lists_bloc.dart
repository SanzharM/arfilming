import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_lists_event.dart';
part 'movie_lists_state.dart';

class MovieListsBloc extends Bloc<MovieListsEvent, MovieListsState> {
  MovieListsBloc() : super(MovieListsInitial()) {
    on<MovieListsEvent>((event, emit) {});
  }
}
