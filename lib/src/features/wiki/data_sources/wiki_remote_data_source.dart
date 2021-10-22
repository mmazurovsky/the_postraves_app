import '../../../core/utils/followable_client_helper.dart';
import '../../../models/interfaces/data_interfaces.dart';

import '../../../core/client/remote_client.dart';

import '../../../core/error/exceptions.dart';

abstract class WikiRemoteDataSource<
    FULLFOLLOWABLE extends GeneralFollowableInterface> {
  Future<FULLFOLLOWABLE> fetchBasicDataById({
    required int id,
    required Map<String, String> httpHeaders,
  });

  Future<void> followFollowable({
    required int id,
    required Map<String, String> httpHeaders,
  });
  Future<void> unfollowFollowable({
    required int id,
    required Map<String, String> httpHeaders,
  });
}

class WikiRemoteDataSourceImpl<
        FULLFOLLOWABLE extends GeneralFollowableInterface>
    implements WikiRemoteDataSource<FULLFOLLOWABLE> {
  final FollowableClientHelper<FULLFOLLOWABLE> _followableClientHelper;

  WikiRemoteDataSourceImpl(this._followableClientHelper);

  @override
  Future<FULLFOLLOWABLE> fetchBasicDataById({
    required int id,
    required Map<String, String> httpHeaders,
  }) async {
    var decodedResponse;

    try {
      decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath:
            _followableClientHelper.getEndpointForFollowable() + '/public/$id',
        httpHeaders: httpHeaders,
      );
    } on Exception {
      throw ServerException();
    }
    return _followableClientHelper.deserializeFollowable(decodedResponse);
  }

  @override
  Future<void> followFollowable({
    required int id,
    required Map<String, String> httpHeaders,
  }) async {
    await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath:
            _followableClientHelper.getEndpointAndPathForUserFollowing() +
                '/$id',
        httpHeaders: httpHeaders);
    return; //TODO: ensure is ok
  }

  @override
  Future<void> unfollowFollowable(
      {required int id, required Map<String, String> httpHeaders}) async {
    await RemoteClient.makeDeleteRequestAndReturnResponse(
        endpointWithPath:
            _followableClientHelper.getEndpointAndPathForUserFollowing() +
                '/$id',
        httpHeaders: httpHeaders);
    return; //TODO: ensure is ok
  }
}
