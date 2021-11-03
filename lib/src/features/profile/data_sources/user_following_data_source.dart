import 'package:the_postraves_app/src/common/utils/followable_client_helper.dart';
import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';


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
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
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
