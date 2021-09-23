import '../../../models/related_to_event/timetable_for_scene.dart';
import '../../../models/shorts/artist_short.dart';
import '../../../models/shorts/unity_short.dart';
import '../../../core/client/remote_client.dart';

abstract class EventRemoteDataSource {
  Future<List<UnityShort>> fetchOrganizersForEventById({
    required int id,
    required Map<String, String> httpHeaders,
  });

  Future<List<ArtistShort>> fetchLineupForEventById({
    required int id,
    required Map<String, String> httpHeaders,
  });

  Future<List<TimetableForScene>> fetchTimetableForEventById({
    required int id,
    required Map<String, String> httpHeaders,
  });
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {

  @override
  Future<List<ArtistShort>> fetchLineupForEventById({required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'event/public/$id/lineup',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => ArtistShort.fromJson(json)).toList();
  }

  @override
  Future<List<UnityShort>> fetchOrganizersForEventById({required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'event/public/$id/organizers',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => UnityShort.fromJson(json)).toList();
  }

  @override
  Future<List<TimetableForScene>> fetchTimetableForEventById({required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'event/public/$id/timetable',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => TimetableForScene.fromJson(json)).toList();
  }
}
