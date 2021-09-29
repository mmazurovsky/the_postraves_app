import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../utils/my_constants.dart';
import '../error/exceptions.dart';
import 'package:http/http.dart' as http_client;

class RemoteClient {
  static Uri _createUri(String endpointWithPath,
      {Map<String, dynamic>? queryParameters}) {
    return Uri.https(MyConstants.host, endpointWithPath, queryParameters);
  }

  static Future<dynamic> makeGetRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters}) async {
    final languageCode = Platform.localeName.substring(0, 2).toLowerCase();
    final Map<String, dynamic> queryParametersWithLanguageCode = {
      "lang": languageCode
    };
    queryParametersWithLanguageCode.addAll(queryParameters ?? {});
    Uri uri = RemoteClient._createUri(endpointWithPath,
        queryParameters: queryParametersWithLanguageCode);

    http_client.Response response;
    dynamic responseAsJsonDecoded;
    try {
      log('GET ${uri.toString()}');
      response = await http_client.get(
        uri,
        headers: httpHeaders,
      );

      if (response.statusCode.toString()[0] == '4' ||
          response.statusCode.toString()[0] == '5') {
        log('Status code is: ${response.statusCode}, body: ${response.body}');

        throw Exception(); //todo
      }

      responseAsJsonDecoded = response.body.isNotEmpty
          ? json.decode(utf8.decode(response.bodyBytes))
          : null;
    } on Exception catch (e) {
      log(e.toString());
      throw ServerException();
    }

    return responseAsJsonDecoded;
  }

  static Future<dynamic> makePostRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    Uri uri = RemoteClient._createUri(endpointWithPath,
        queryParameters: queryParameters);

    http_client.Response response;
    try {
      log('POST ${uri.toString()}');
      response = await http_client.post(
        uri,
        headers: httpHeaders,
        body: jsonEncode(body),
      );
    } on Exception {
      throw ServerException();
    }

    if (response.statusCode.toString()[0] == '4' ||
        response.statusCode.toString()[0] == '5') {
      log('Status code is: ${response.statusCode}, body: ${response.body}');
      throw Exception(); //todo
    }

    final responseAsJsonDecoded = json.decode(utf8.decode(response.bodyBytes));
    return responseAsJsonDecoded;
  }

  static Future<dynamic> makePutRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    Uri uri = RemoteClient._createUri(endpointWithPath,
        queryParameters: queryParameters);

    http_client.Response response;
    try {
      log('PUT ${uri.toString()}');
      response = await http_client.put(
        uri,
        headers: httpHeaders,
        body: jsonEncode(body),
      );
    } on Exception {
      throw ServerException();
    }

    if (response.statusCode.toString()[0] == '4' ||
        response.statusCode.toString()[0] == '5') {
      log('Status code is: ${response.statusCode}, body: ${response.body}');
      throw Exception(); //todo
    }

    final responseAsJsonDecoded = json.decode(utf8.decode(response.bodyBytes));
    return responseAsJsonDecoded;
  }

  static Future<dynamic> makeDeleteRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    Uri uri = RemoteClient._createUri(endpointWithPath,
        queryParameters: queryParameters);

    http_client.Response response;
    try {
      log('DELETE ${uri.toString()}');
      response = await http_client.delete(
        uri,
        headers: httpHeaders,
        body: jsonEncode(body),
      );
    } on Exception {
      throw ServerException();
    }

    if (response.statusCode.toString()[0] == '4' ||
        response.statusCode.toString()[0] == '5') {
      log('Status code is: ${response.statusCode}, body: ${response.body}');
      throw Exception(); //todo
    }

    final responseAsJsonDecoded = json.decode(utf8.decode(response.bodyBytes));
    return responseAsJsonDecoded;
  }
}
