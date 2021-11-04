import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/client/followable_client_helper.dart';
import 'package:the_postraves_package/client/remote_client.dart';
import 'package:the_postraves_package/constants/server_constants.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

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
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath:
          _followableClientHelper.getEndpointForFollowable() + '/public/$id',
      httpHeaders: httpHeaders,
    );
    return _followableClientHelper.deserializeFollowable(decodedResponse);
  }

  @override
  Future<void> followFollowable({
    required int id,
    required Map<String, String> httpHeaders,
  }) async {
    await RemoteClient.makePostRequestAndReturnResponse(
        host: ServerConstants.apiHost,
        hostPath: ServerConstants.apiPath,
        endpointWithPath:
            _followableClientHelper.getEndpointAndPathForUserFollowing() +
                '/$id',
        httpHeaders: httpHeaders);
    return; //TODO: better have something in return to ensure everything is ok
  }

  @override
  Future<void> unfollowFollowable(
      {required int id, required Map<String, String> httpHeaders}) async {
    await RemoteClient.makeDeleteRequestAndReturnResponse(
        host: ServerConstants.apiHost,
        hostPath: ServerConstants.apiPath,
        endpointWithPath:
            _followableClientHelper.getEndpointAndPathForUserFollowing() +
                '/$id',
        httpHeaders: httpHeaders);
    return; //TODO: better have something in return to ensure everything is ok
  }
}
