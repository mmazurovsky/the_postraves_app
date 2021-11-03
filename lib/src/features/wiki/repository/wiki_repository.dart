import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

import '../data_sources/wiki_remote_data_source.dart';

abstract class WikiRepository<FULLFOLLOWABLE extends GeneralFollowableInterface> {
  Future<ResponseSealed<FULLFOLLOWABLE>> fetchBasicDataById(int id);
  Future<ResponseSealed<void>> followFollowable(int id);
  Future<ResponseSealed<void>> unfollowFollowable(int id);
}

class WikiRepositoryImpl<FULLFOLLOWABLE extends GeneralFollowableInterface>
    extends WikiRepository<FULLFOLLOWABLE> {
  final WikiRemoteDataSource<FULLFOLLOWABLE> wikiRemoteDataSource;
  final RemoteRequestWrapper<FULLFOLLOWABLE> remoteRequestWrapper;
  final RemoteRequestWrapper<void> remoteRequestWrapperVoid;

  WikiRepositoryImpl({
    required this.wikiRemoteDataSource,
    required this.remoteRequestWrapper,
    required this.remoteRequestWrapperVoid,
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
    return await remoteRequestWrapperVoid(
        (httpHeaders) => wikiRemoteDataSource.followFollowable(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<void>> unfollowFollowable(int id) async {
    return await remoteRequestWrapperVoid(
        (httpHeaders) => wikiRemoteDataSource.unfollowFollowable(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }
}
