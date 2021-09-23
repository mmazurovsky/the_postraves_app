import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../core/client/remote_request_wrapper.dart';
import '../data_sources/event_remote_data_source.dart';
import '../../../models/related_to_event/timetable_for_scene.dart';
import '../../../models/shorts/artist_short.dart';
import '../../../models/shorts/unity_short.dart';

abstract class EventRepository {
  Future<ResponseSealed<List<UnityShort>>> fetchOrganizersForEventById(int id);
  Future<ResponseSealed<List<ArtistShort>>> fetchLineupForEventById(int id);
  Future<ResponseSealed<List<TimetableForScene>>> fetchTimetableForEventById(int id);
}

class EventRepositoryImpl extends EventRepository {
  final EventRemoteDataSource eventRemoteDataSource;
  final RemoteRequestWrapper<List<UnityShort>> remoteRequestWrapperUnities;
  final RemoteRequestWrapper<List<ArtistShort>> remoteRequestWrapperArtists;
  final RemoteRequestWrapper<List<TimetableForScene>> remoteRequestWrapperTimetable;

  EventRepositoryImpl({
    required this.eventRemoteDataSource,
    required this.remoteRequestWrapperUnities,
    required this.remoteRequestWrapperArtists,
    required this.remoteRequestWrapperTimetable,
  });

  @override
  Future<ResponseSealed<List<UnityShort>>> fetchOrganizersForEventById(int id) async {
    return await remoteRequestWrapperUnities(
        (httpHeaders) => eventRemoteDataSource.fetchOrganizersForEventById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<ArtistShort>>> fetchLineupForEventById(int id) async {
    return await remoteRequestWrapperArtists(
        (httpHeaders) => eventRemoteDataSource.fetchLineupForEventById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<TimetableForScene>>> fetchTimetableForEventById(int id) async {
    return await remoteRequestWrapperTimetable(
        (httpHeaders) => eventRemoteDataSource.fetchTimetableForEventById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }
}
