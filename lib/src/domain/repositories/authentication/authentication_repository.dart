import 'package:arfilming/src/data/datasources/authentication/authentication_datasource.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationResponse> getRequestToken();

  Future<AuthenticationResponse> createSession();

  Future<AuthenticationResponse> deleteSession();
}
