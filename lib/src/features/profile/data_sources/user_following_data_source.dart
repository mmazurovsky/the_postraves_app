import '../../../core/utils/followable_client_helper.dart';
import '../../../models/interfaces/data_interfaces.dart';
import '../../../core/client/remote_client.dart';

abstract class UserFollowingDataSource<
    SHORTFOLLOWABLE extends GeneralFollowableInterface> {
  Future<List<SHORTFOLLOWABLE>> getFollowing(
      {required Map<String, String> httpHeaders});
}

class UserFollowingDataSourceImpl<
        SHORTFOLLOWABLE extends GeneralFollowableInterface>
    implements UserFollowingDataSource<SHORTFOLLOWABLE> {
  final FollowableClientHelper<SHORTFOLLOWABLE> followableClientHelper;

  UserFollowingDataSourceImpl(this.followableClientHelper);

  @override
  Future<List<SHORTFOLLOWABLE>> getFollowing(
      {required Map<String, String> httpHeaders}) async {
    final decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath:
          followableClientHelper.getEndpointAndPathForUserFollowing(),
      httpHeaders: httpHeaders,
    ) as List<dynamic>?;

    return decodedResponse == null
        ? []
        : decodedResponse
            .map((json) => followableClientHelper.deserializeFollowable(json))
            .toList();
  }
}
