import 'package:the_postraves_package/client/client_helper.dart';
import 'package:the_postraves_package/client/localized_request.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

abstract class UserFollowingDataSource<
    SHORTFOLLOWABLE extends GeneralFollowableInterface> {
  Future<List<SHORTFOLLOWABLE>> getFollowing(
      {required Map<String, String> httpHeaders});
}

class UserFollowingDataSourceImpl<
        SHORTFOLLOWABLE extends GeneralFollowableInterface>
    implements UserFollowingDataSource<SHORTFOLLOWABLE> {
  final LocalizedGetRequest _localizedGetRequest;
  final ClientHelper<SHORTFOLLOWABLE> clientHelper;

  UserFollowingDataSourceImpl(
    this._localizedGetRequest,
    this.clientHelper,
  );

  @override
  Future<List<SHORTFOLLOWABLE>> getFollowing(
      {required Map<String, String> httpHeaders}) async {
    final decodedResponse = await _localizedGetRequest(
      endpointWithPath: clientHelper.getEndpointAndPathForUserFollowing(),
      httpHeaders: httpHeaders,
    ) as List<dynamic>?;

    return decodedResponse
            ?.map((json) => clientHelper.deserialize(json))
            .toList() ??
        [];
  }
}
