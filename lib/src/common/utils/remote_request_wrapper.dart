import 'dart:io';
import 'package:easy_localization/src/public_ext.dart';
import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/errors/exceptions.dart';
import 'package:the_postraves_package/errors/failures.dart';

import '../authentication/repository/firebase_auth_repository.dart';
import 'network_info.dart';

class RemoteRequestWrapperImpl<T> implements RemoteRequestWrapper<T> {
  final NetworkInfo _networkInfo;
  final FirebaseAuthRepository _firebaseRepositiory;

  RemoteRequestWrapperImpl(
    this._networkInfo,
    this._firebaseRepositiory,
  );

  @override
  Future<ResponseSealed<T>> call(Future<T> Function(Map<String, String>) request) async {
    if (await _networkInfo.isConnectedToNetwork) {
      try {
        // INFO: argumentFunction is code from remote data sources
        final authToken = _firebaseRepositiory.currentUser != null
            ? await _firebaseRepositiory.currentUser!.getIdToken()
            : null;
        final Map<String, String> httpHeaders = authToken != null
            ? {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader: 'Bearer $authToken',
              }
            : {
                HttpHeaders.contentTypeHeader: 'application/json',
              };
        final T result = await request(httpHeaders);
        return ResponseSealed.success(result);
      } on MyServerException catch (e) {
        return ResponseSealed.failure(
          ServerFailure(e.message),
        );
      }
    } else {
      return ResponseSealed.failure(DeviceNetworkFailure('noInternet'.tr()));
    }
  }
}
