import '../../../models/related_to_place/scene.dart';
import '../../../models/shorts/event_short.dart';
import '../../../core/client/remote_client.dart';

abstract class PlaceRemoteDataSource {
  Future<List<Scene>> fetchScenesForPlaceById({
    required int id,
    required Map<String, String> httpHeaders,
  });

  Future<List<EventShort>> fetchEventsForPlaceById({
    required int id,
    required Map<String, String> httpHeaders,
  });
}

class PlaceRemoteDataSourceImpl implements PlaceRemoteDataSource {

  @override
  Future<List<EventShort>> fetchEventsForPlaceById(
      {required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'place/public/$id/events',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => EventShort.fromJson(json)).toList();
  }

  @override
  Future<List<Scene>> fetchScenesForPlaceById(
      {required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'place/public/$id/scenes',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => Scene.fromJson(json)).toList();
  }
}
