import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

import '../data_sources/unity_remote_data_source.dart';

abstract class UnityRepository {
  Future<ResponseSealed<List<ArtistShort>>> fetchArtistsForUnityById(int id);
  Future<ResponseSealed<List<EventShort>>> fetchEventsForArtistById(int id);
}

class UnityRepositoryImpl extends UnityRepository {
  final UnityRemoteDataSource unityRemoteDataSource;
  final RemoteRequestWrapper<List<EventShort>> remoteRequestWrapperEvents;
  final RemoteRequestWrapper<List<ArtistShort>> remoteRequestWrapperArtists;

  UnityRepositoryImpl({
    required this.unityRemoteDataSource,
    required this.remoteRequestWrapperEvents,
    required this.remoteRequestWrapperArtists,
  });

  @override
  Future<ResponseSealed<List<EventShort>>> fetchEventsForArtistById(int id) async {
    return await remoteRequestWrapperEvents(
        (httpHeaders) => unityRemoteDataSource.fetchEventsForUnityById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<ArtistShort>>> fetchArtistsForUnityById(int id) async {
    return await remoteRequestWrapperArtists(
        (httpHeaders) => unityRemoteDataSource.fetchArtistsForUnityById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }
}
