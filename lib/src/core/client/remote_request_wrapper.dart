import 'dart:io';

import '../authentication/repository/firebase_auth_repository_impl.dart';
import '../error/failures.dart';

import 'data_sealed/response_sealed.dart';
import 'network_info.dart';

abstract class RemoteRequestWrapper<T> {
  RemoteRequestWrapper(Null Function() param0);

  Future<ResponseSealed<T>> call(Function argumentFunction);
}

class RemoteRequestWrapperImpl<T> implements RemoteRequestWrapper<T> {
  final NetworkInfo _networkInfo;
  final FirebaseAuthRepository _firebaseRepositiory;

  RemoteRequestWrapperImpl(
    this._networkInfo,
    this._firebaseRepositiory,
  );

  @override
  Future<ResponseSealed<T>> call(
    Function argumentFunction
  ) async {
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
        final T result = await argumentFunction(httpHeaders);
        return ResponseSealed.success(result);
      } on Exception catch (e) {
        return ResponseSealed.failure(ServerFailure(), e.toString()); // todo don't know about toString on e
      }
    } else {
      return ResponseSealed.failure(DeviceNetworkFailure());
    }
  }
}