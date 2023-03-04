import 'package:arfilming/src/core/api/api.dart';

part 'user_response.dart';

abstract class UserDatasource {
  Future<UserResponse> fetch();
}

class UserDatasourceImpl implements UserDatasource {
  final Api api;

  const UserDatasourceImpl(this.api);

  @override
  Future<UserResponse> fetch() async {
    final response = await api.request(
      uri: Uri.https(ApiEndpoints.baseUrl, ApiEndpoints.getUserDetails),
      method: Method.get,
    );
    return UserResponse(
      statusCode: response.statusCode,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }
}
