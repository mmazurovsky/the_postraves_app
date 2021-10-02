import 'dart:convert';

import 'package:http/http.dart' as http_client;

enum HttpMethod { get, post, put, delete }

extension HttpMethodExtension on HttpMethod {
  static _methodNameMapping(HttpMethod thisMethod) => {
        HttpMethod.get: 'GET',
        HttpMethod.post: 'POST',
        HttpMethod.put: 'PUT',
        HttpMethod.delete: 'DELETE',
      }[thisMethod];

  static _methodFunctionMapping(HttpMethod thisMethod) => {
        HttpMethod.get: (
                {required Uri url,
                Map<String, String>? headers,
                Object? body,
                Encoding? encoding}) =>
            http_client.get(
              url,
              headers: headers,
            ),
        HttpMethod.post: (
                {required Uri url,
                Map<String, String>? headers,
                Object? body,
                Encoding? encoding}) =>
            http_client.post(
              url,
              headers: headers,
              body: body,
              encoding: encoding,
            ),
        HttpMethod.put: (
                {required Uri url,
                Map<String, String>? headers,
                Object? body,
                Encoding? encoding}) =>
            http_client.put(
              url,
              headers: headers,
              body: body,
              encoding: encoding,
            ),
        HttpMethod.delete: (
                {required Uri url,
                Map<String, String>? headers,
                Object? body,
                Encoding? encoding}) =>
            http_client.delete(
              url,
              headers: headers,
              body: body,
              encoding: encoding,
            ),
      }[thisMethod];

  String get methodName => _methodNameMapping(this);
  Future<http_client.Response> Function(
      {required Uri url,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding}) get methodFunction => _methodFunctionMapping(this);
}
