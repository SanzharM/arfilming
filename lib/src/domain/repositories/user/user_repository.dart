import 'package:arfilming/src/data/datasources/user/user_datasource.dart';

abstract class UserRepository {
  Future<UserResponse> fetch();

  Future<UserResponse> addToWatchlist();

  Future<UserResponse> getWatchlist();

  Future<UserResponse> getRatedMovies();
}
