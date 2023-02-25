import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:arfilming/src/core/api/api_endpoints.dart';
import 'package:arfilming/src/service_locator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
export 'api_endpoints.dart';

part 'api_response.dart';

enum Method { get, post, put, delete }

class Api {
  static final Map<String, String> _headers = {
    'Content-type': 'application/json',
  };

  static Future<bool> _checkInternetConnection() async {
    final result = await sl<Connectivity>().checkConnectivity();
    if (result == ConnectivityResult.ethernet || result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<ApiResponse> request({
    required Uri uri,
    required Method method,
    Map<String, dynamic>? params,
    bool needToken = false,
    Duration timeout = const Duration(seconds: 15),
    bool checkConnectivity = true,
  }) async {
    if (checkConnectivity) {
      final hasConnection = await _checkInternetConnection();
      if (!hasConnection) {
        return const ApiResponse(statusCode: -1, error: 'No internet connection');
      }
    }

    http.Response? response;

    // if (needToken) {
    //   final token = await sl<LocalStorage>().getToken();
    //   if (token?.isNotEmpty ?? false) _headers.addAll({'Authorization': 'Bearer ${token!}'});
    // }

    final Uri url = Uri.https(
      uri.authority,
      uri.path,
      <String, String>{
        ...uri.queryParameters,
        'api_key': ApiEndpoints.apiKey,
      },
    );

    final body = jsonEncode(params);

    try {
      switch (method) {
        case Method.get:
          response = await http.get(url, headers: _headers).timeout(timeout);
          break;
        case Method.post:
          response = await http.post(url, headers: _headers, body: body).timeout(timeout);
          break;
        case Method.put:
          response = await http.put(url, headers: _headers, body: body).timeout(timeout);
          break;
        case Method.delete:
          response = await http.delete(url, headers: _headers, body: body).timeout(timeout);
          break;
      }
    } on TimeoutException catch (_) {
      logException(_, url.toString(), headers: _headers, body: body);
      return const ApiResponse(statusCode: -1, error: 'Request timed out');
    } on SocketException catch (_) {
      logException(_, url.toString(), headers: _headers, body: body);
      return const ApiResponse(statusCode: -1, error: 'Connection closed');
    } catch (_) {
      logException(_, url.toString(), headers: _headers, body: body);
      return const ApiResponse(statusCode: -1, error: 'Something went wrong');
    }

    logResponse(response, params: params);

    final isSuccess = response.statusCode >= 200 && response.statusCode <= 299;
    return ApiResponse(
      statusCode: response.statusCode,
      response: response,
      error: isSuccess ? null : await compute(_parseError, response),
    );
  }

  static String? _parseError(http.Response? response) {
    try {
      final json = jsonDecode(utf8.decode(response!.bodyBytes)) as Map<String, dynamic>;
      return json['message'] ?? json['detail'] ?? _getErrorFromStatusCode(response.statusCode);
    } catch (e) {
      if (response != null) {
        return _getErrorFromStatusCode(response.statusCode);
      }
    }
    return null;
  }

  static String _getErrorFromStatusCode(int statusCode) {
    switch (statusCode) {
      case 500:
        return 'Internal Server Error';
      case 404:
        return 'Page not found';
      case 403:
        return 'Forbidden';
      case 401:
        return 'Unauthorized';

      default:
        return 'Something went wrong ($statusCode). Please, try again later';
    }
  }

  static String urlWithParams(String url, Map<String, String>? params) {
    if (params == null) return url;
    params.forEach((key, value) => url = url.replaceAll(key, value));
    return url;
  }

  static void logResponse(http.Response response, {dynamic params}) {
    debugPrint('\nLog time: ${DateTime.now()}');
    debugPrint('URL: ${response.request?.url}');
    debugPrint('Headers: ${response.request?.headers}');
    debugPrint('Method: ${response.request?.method}');
    debugPrint('Status Code: ${response.statusCode}');
    if (params != null) debugPrint('Params: $params');
    try {
      debugPrint('Body: ${utf8.decode(response.bodyBytes)}');
    } catch (e) {
      debugPrint('Body: Unable to parse: $e');
    }
    debugPrint('------------\n');
  }

  static void logException(Object exception, String url, {Map<String, dynamic>? headers, dynamic body}) {
    debugPrint('\nException: ${exception.toString()}');
    debugPrint('Log time: ${DateTime.now()}');
    debugPrint('URL: $url');
    if (headers != null) debugPrint('Headers: $headers');
    if (body != null) debugPrint('Body: $body');
    debugPrint('------------\n');
  }
}
