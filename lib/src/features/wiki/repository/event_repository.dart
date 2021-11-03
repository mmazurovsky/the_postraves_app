import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/related_to_event/timetable_for_scene.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

import '../data_sources/event_remote_data_source.dart';

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

  EventRepositoryImpl(
    this.eventRemoteDataSource,
    this.remoteRequestWrapperUnities,
    this.remoteRequestWrapperArtists,
    this.remoteRequestWrapperTimetable,
  );

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
