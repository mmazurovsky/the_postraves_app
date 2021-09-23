import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../core/client/remote_request_wrapper.dart';
import '../data_sources/unity_remote_data_source.dart';
import '../../../models/shorts/artist_short.dart';
import '../../../models/shorts/event_short.dart';

abstract class UnityRepository {
  Future<ResponseSealed<List<ArtistShort>>> fetchArtistsForUnityById(int id);
  Future<ResponseSealed<List<EventShort>>> fetchEventsForArtistById(int id);
}

class ArtistRepositoryImpl extends UnityRepository {
  final UnityRemoteDataSource unityRemoteDataSource;
  final RemoteRequestWrapper<List<EventShort>> remoteRequestWrapperEvents;
  final RemoteRequestWrapper<List<ArtistShort>> remoteRequestWrapperArtists;

  ArtistRepositoryImpl({
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
