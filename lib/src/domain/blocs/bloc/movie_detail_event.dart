part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

class MovieDetailFetchEvent extends MovieDetailEvent {
  final int id;

  MovieDetailFetchEvent(this.id);
}
