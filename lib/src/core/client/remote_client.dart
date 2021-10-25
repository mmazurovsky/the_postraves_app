import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../utils/my_constants.dart';
import '../error/exceptions.dart';
import 'package:http/http.dart' as http_client;

import 'http_method_enum.dart';

class RemoteClient {
  static Future<dynamic> makeGetRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters}) async {
    final languageCode = Platform.localeName.substring(0, 2).toLowerCase();
    final Map<String, dynamic> queryParametersWithLanguageCode = {
      "lang": languageCode
    };
    queryParametersWithLanguageCode.addAll(queryParameters ?? {});

    final httpRequest = _MyHttpRequest(
      httpMethod: HttpMethod.get,
      endpointWithPath: endpointWithPath,
      queryParameters: queryParametersWithLanguageCode,
      httpHeaders: httpHeaders,
    );

    return httpRequest();
  }

  static Future<dynamic> makePostRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    final httpRequest = _MyHttpRequest(
      httpMethod: HttpMethod.post,
      endpointWithPath: endpointWithPath,
      httpHeaders: httpHeaders,
      queryParameters: queryParameters,
      body: body,
    );

    return httpRequest();
  }

  static Future<dynamic> makePutRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    final httpRequest = _MyHttpRequest(
      httpMethod: HttpMethod.put,
      endpointWithPath: endpointWithPath,
      httpHeaders: httpHeaders,
      queryParameters: queryParameters,
      body: body,
    );

    return httpRequest();
  }

  static Future<dynamic> makeDeleteRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    final httpRequest = _MyHttpRequest(
      httpMethod: HttpMethod.delete,
      endpointWithPath: endpointWithPath,
      httpHeaders: httpHeaders,
      queryParameters: queryParameters,
      body: body,
    );

    return httpRequest();
  }
}

class _MyHttpRequest {
  final String endpointWithPath;
  final HttpMethod httpMethod;
  final Map<String, String> httpHeaders;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? body;
  late Uri uri;

  _MyHttpRequest({
    required this.endpointWithPath,
    required this.httpHeaders,
    required this.httpMethod,
    this.queryParameters,
    this.body,
  }) {
    uri = _createUri();
  }

  dynamic call() async {
    _logRequest();

    final response = await _makeRequest();

    _checkResponse(response);

    final responseAsJson = _decodeResponseToJson(response);
    return responseAsJson;
  }

  Uri _createUri() {
    return Uri.https(MyConstants.apiHost, '${MyConstants.apiPath}$endpointWithPath', queryParameters);
  }

  void _logRequest() {
    log('${httpMethod.methodName} ${uri.toString()}');
    // log(httpHeaders[HttpHeaders.authorizationHeader].toString());
  }

  Future<http_client.Response> _makeRequest() {
    return httpMethod.methodFunction(
      url: uri,
      headers: httpHeaders,
      body: jsonEncode(body),
    );
  }

  dynamic _decodeResponseToJson(http_client.Response response) {
    return response.body.isNotEmpty
        ? json.decode(utf8.decode(response.bodyBytes))
        : null;
  }

  void _checkResponse(http_client.Response response) {
    if (response.statusCode.toString()[0] == '4' ||
        response.statusCode.toString()[0] == '5') {
      final exceptionMessage =
          'Status code is: ${response.statusCode}, body: ${response.body}';
      log(exceptionMessage);
      throw ServerException(); //TODO Exception
    }
  }
}
