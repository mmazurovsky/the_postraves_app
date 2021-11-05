import 'dart:io';

import 'package:the_postraves_package/client/http_method_enum.dart';
import 'package:the_postraves_package/client/localized_request.dart';
import 'package:the_postraves_package/client/remote_request.dart';
import 'package:the_postraves_package/constants/server_constants.dart';

class LocalizedGetRequestImpl implements LocalizedGetRequest {
  final RemoteRequest _remoteRequest;

  LocalizedGetRequestImpl(this._remoteRequest);
  
  @override
  Future<dynamic> call(
      {required String endpointWithPath,
      required Map<String, String> httpHeaders,
      Map<String, dynamic>? queryParameters}) async {
    final languageCode = Platform.localeName.substring(0, 2).toLowerCase();
    final Map<String, dynamic> queryParametersWithLanguageCode = {
      "lang": languageCode
    };
    queryParametersWithLanguageCode.addAll(queryParameters ?? {});
    return _remoteRequest(
      httpMethod: HttpMethod.get,
      host: ServerConstants.apiHost,
      hostPath: ServerConstants.apiPath,
      endpointWithPath: endpointWithPath,
      httpHeaders: httpHeaders,
      queryParameters: queryParametersWithLanguageCode,
    );
  }
}
