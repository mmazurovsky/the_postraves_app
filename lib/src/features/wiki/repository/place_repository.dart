import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/related_to_place/scene.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

import '../data_sources/place_remote_data_source.dart';

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
