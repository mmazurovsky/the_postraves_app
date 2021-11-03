import 'dart:io';

import 'package:the_postraves_package/client/remote_client.dart';
import 'package:the_postraves_package/constants/server_constants.dart';

class LocalizedGetRequest {
  static Future<dynamic> makeGetRequestAndReturnResponse(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters}) async {
    final languageCode = Platform.localeName.substring(0, 2).toLowerCase();
    final Map<String, dynamic> queryParametersWithLanguageCode = {
      "lang": languageCode
    };
    queryParametersWithLanguageCode.addAll(queryParameters ?? {});
    return RemoteClient.makeGetRequestAndReturnResponse(
      host: ServerConstants.apiHost,
      hostPath: ServerConstants.apiPath,
      endpointWithPath: endpointWithPath,
      httpHeaders: httpHeaders,
      queryParameters: queryParametersWithLanguageCode,
    );
  }
}
