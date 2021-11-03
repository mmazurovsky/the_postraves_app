import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

import '../data_sources/artist_remote_data_source.dart';

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
