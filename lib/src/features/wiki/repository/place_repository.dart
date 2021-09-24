import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../core/client/remote_request_wrapper.dart';
import '../data_sources/place_remote_data_source.dart';
import '../../../models/related_to_place/scene.dart';
import '../../../models/shorts/event_short.dart';

abstract class PlaceRepository {
  Future<ResponseSealed<List<Scene>>> fetchScenesForPlaceById(int id);
  Future<ResponseSealed<List<EventShort>>> fetchEventsForPlaceById(int id);
}

class PlaceRepositoryImpl extends PlaceRepository {
  final PlaceRemoteDataSource placeRemoteDataSource;
  final RemoteRequestWrapper<List<EventShort>> remoteRequestWrapperEvents;
  final RemoteRequestWrapper<List<Scene>> remoteRequestWrapperScenes;

  PlaceRepositoryImpl({
    required this.placeRemoteDataSource,
    required this.remoteRequestWrapperEvents,
    required this.remoteRequestWrapperScenes,
  });

  @override
  Future<ResponseSealed<List<EventShort>>> fetchEventsForPlaceById(int id) async {
    return await remoteRequestWrapperEvents(
        (httpHeaders) => placeRemoteDataSource.fetchEventsForPlaceById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<Scene>>> fetchScenesForPlaceById(int id) async {
    return await remoteRequestWrapperScenes(
        (httpHeaders) => placeRemoteDataSource.fetchScenesForPlaceById(
              id: id,
              httpHeaders: httpHeaders,
            ));
  }
}
