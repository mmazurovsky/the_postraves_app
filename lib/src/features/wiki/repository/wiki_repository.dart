import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../core/client/remote_request_wrapper.dart';
import '../data_sources/wiki_remote_data_source.dart';
import '../../../models/interfaces/data_interfaces.dart';

abstract class WikiRepository<FULLFOLLOWABLE extends FollowableInterface> {
  Future<ResponseSealed<FULLFOLLOWABLE>> fetchBasicDataById(int id);
  Future<ResponseSealed<void>> followFollowable(int id);
  Future<ResponseSealed<void>> unfollowFollowable(int id);
}

class WikiRepositoryImpl<FULLFOLLOWABLE extends FollowableInterface>
    extends WikiRepository<FULLFOLLOWABLE> {
  final WikiRemoteDataSource<FULLFOLLOWABLE> wikiRemoteDataSource;
  final RemoteRequestWrapper<FULLFOLLOWABLE> remoteRequestWrapper;

  WikiRepositoryImpl({
    required this.wikiRemoteDataSource,
    required this.remoteRequestWrapper,
  });

  @override
  Future<ResponseSealed<FULLFOLLOWABLE>> fetchBasicDataById(int id) async {
    return await remoteRequestWrapper(
        (httpHeaders) => wikiRemoteDataSource.fetchBasicDataById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<void>> followFollowable(int id) async {
    return await remoteRequestWrapper(
        (httpHeaders) => wikiRemoteDataSource.followFollowable(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<void>> unfollowFollowable(int id) async {
    return await remoteRequestWrapper(
        (httpHeaders) => wikiRemoteDataSource.unfollowFollowable(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }
}
