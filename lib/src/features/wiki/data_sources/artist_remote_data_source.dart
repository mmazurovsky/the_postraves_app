import '../../../models/shorts/event_short.dart';
import '../../../models/shorts/unity_short.dart';
import '../../../core/client/remote_client.dart';

abstract class ArtistRemoteDataSource {
  Future<List<UnityShort>> fetchUnitiesForArtistById({
    required int id,
    required Map<String, String> httpHeaders,
  });

  Future<List<EventShort>> fetchEventsForArtistById({
    required int id,
    required Map<String, String> httpHeaders,
  });
}

class ArtistRemoteDataSourceImpl implements ArtistRemoteDataSource {

  @override
  Future<List<EventShort>> fetchEventsForArtistById(
      {required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'artist/public/$id/events',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => EventShort.fromJson(json)).toList();
  }

  @override
  Future<List<UnityShort>> fetchUnitiesForArtistById(
      {required int id, required Map<String, String> httpHeaders}) async {
    var decodedResponse;
    decodedResponse = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: 'artist/public/$id/unities',
        httpHeaders: httpHeaders);
    return decodedResponse.map((json) => UnityShort.fromJson(json)).toList();
  }
}
