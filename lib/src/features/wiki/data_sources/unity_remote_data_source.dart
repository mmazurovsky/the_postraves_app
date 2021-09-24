import '../../../models/shorts/artist_short.dart';
import '../../../models/shorts/event_short.dart';
import '../../../core/client/remote_client.dart';

abstract class UnityRemoteDataSource {
  Future<List<ArtistShort>> fetchArtistsForUnityById({
    required int id,
    required Map<String, String> httpHeaders,
  });

  Future<List<EventShort>> fetchEventsForUnityById({
    required int id,
    required Map<String, String> httpHeaders,
  });
}

class UnityRemoteDataSourceImpl implements UnityRemoteDataSource {

  @override
  Future<List<EventShort>> fetchEventsForUnityById(
      {required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath: 'unity/public/$id/events',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => EventShort.fromJson(json)).toList();
  }

  @override
  Future<List<ArtistShort>> fetchArtistsForUnityById(
      {required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath: 'unity/public/$id/artists',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => ArtistShort.fromJson(json)).toList();
  }
}
