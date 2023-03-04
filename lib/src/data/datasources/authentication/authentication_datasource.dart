import 'package:arfilming/src/core/api/api.dart';

part 'authentication_response.dart';

abstract class AuthenticationDatasource {
  Future<AuthenticationResponse> getRequestToken();
  Future<AuthenticationResponse> createSession();
  Future<AuthenticationResponse> deleteSession();
}

class AuthenticationDataSourceImpl implements AuthenticationDatasource {
  final Api _api;

  const AuthenticationDataSourceImpl(this._api);

  @override
  Future<AuthenticationResponse> createSession() {
    // TODO: implement createSession
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationResponse> deleteSession() {
    // TODO: implement deleteSession
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationResponse> getRequestToken() async {
    final response = await _api.request(
      uri: Uri.https(ApiEndpoints.baseUrl, ApiEndpoints.createToken),
      method: Method.get,
    );
    return AuthenticationResponse(
      statusCode: response.statusCode,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }
}
