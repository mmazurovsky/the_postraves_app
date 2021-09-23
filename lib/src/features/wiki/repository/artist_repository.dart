
import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../core/client/remote_request_wrapper.dart';
import '../data_sources/artist_remote_data_source.dart';
import '../data_sources/wiki_remote_data_source.dart';
import '../../../models/interfaces/data_interfaces.dart';
import '../../../models/shorts/event_short.dart';
import '../../../models/shorts/unity_short.dart';

abstract class ArtistRepository {
  Future<ResponseSealed<List<UnityShort>>> fetchUnitiesForArtistById(int id);
  Future<ResponseSealed<List<EventShort>>> fetchEventsForArtistById(int id);
}

class ArtistRepositoryImpl extends ArtistRepository {
  final ArtistRemoteDataSource artistRemoteDataSource;
  final RemoteRequestWrapper<List<EventShort>> remoteRequestWrapperEvents;
  final RemoteRequestWrapper<List<UnityShort>> remoteRequestWrapperUnities;

  ArtistRepositoryImpl({
    required this.artistRemoteDataSource,
    required this.remoteRequestWrapperEvents,
    required this.remoteRequestWrapperUnities,
  });

  @override
  Future<ResponseSealed<List<EventShort>>> fetchEventsForArtistById(int id) async {
    return await remoteRequestWrapperEvents(
        (httpHeaders) => artistRemoteDataSource.fetchEventsForArtistById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<UnityShort>>> fetchUnitiesForArtistById(int id) async {
    return await remoteRequestWrapperUnities(
        (httpHeaders) => artistRemoteDataSource.fetchUnitiesForArtistById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }
}
