import '../../../common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

import '../data_sources/user_following_data_source.dart';

abstract class UserFollowingRepository<
    SHORTFOLLOWABLE extends GeneralFollowableInterface> {
  Future<ResponseSealed<List<SHORTFOLLOWABLE>>> getFollowing();
}

class UserFollowingRepositoryImpl<
        SHORTFOLLOWABLE extends GeneralFollowableInterface>
    implements UserFollowingRepository<SHORTFOLLOWABLE> {
  final RemoteRequestWrapper<List<SHORTFOLLOWABLE>> _remoteRequestWrapper;
  final UserFollowingDataSource<SHORTFOLLOWABLE> _userFollowingDataSource;

  UserFollowingRepositoryImpl(
    this._remoteRequestWrapper,
    this._userFollowingDataSource,
  );

  @override
  Future<ResponseSealed<List<SHORTFOLLOWABLE>>> getFollowing() async {
    return await _remoteRequestWrapper(
      (httpHeaders) => _userFollowingDataSource.getFollowing(
        httpHeaders: httpHeaders,
      ),
    );
  }
}
