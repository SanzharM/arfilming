part of 'api.dart';

class ApiResponse {
  final int? statusCode;
  final http.Response? response;
  final String? error;

  const ApiResponse({
    this.statusCode,
    this.response,
    this.error,
  });

  bool get isSuccess => (statusCode ?? -1) >= 200 && (statusCode ?? -1) <= 299;
}
