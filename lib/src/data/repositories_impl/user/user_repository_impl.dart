import 'package:arfilming/src/data/datasources/user/user_datasource.dart';
import 'package:arfilming/src/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  const UserRepositoryImpl(this.datasource);

  @override
  Future<UserResponse> addToWatchlist() {
    // TODO: implement addToWatchlist
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> fetch() {
    return datasource.fetch();
  }

  @override
  Future<UserResponse> getRatedMovies() {
    // TODO: implement getRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> getWatchlist() {
    // TODO: implement getWatchlist
    throw UnimplementedError();
  }
}
