import 'package:arfilming/src/data/datasources/authentication/authentication_datasource.dart';
import 'package:arfilming/src/domain/repositories/authentication/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource _datasource;

  const AuthenticationRepositoryImpl(this._datasource);

  @override
  Future<AuthenticationResponse> createSession() {
    return _datasource.createSession();
  }

  @override
  Future<AuthenticationResponse> deleteSession() {
    return _datasource.deleteSession();
  }

  @override
  Future<AuthenticationResponse> getRequestToken() {
    return _datasource.getRequestToken();
  }
}
