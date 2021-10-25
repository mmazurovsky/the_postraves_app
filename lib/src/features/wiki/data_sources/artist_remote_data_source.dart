import '../../../core/client/remote_client.dart';
import '../../../models/shorts/event_short.dart';
import '../../../models/shorts/unity_short.dart';

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
    final decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath: 'artist/public/$id/events',
        httpHeaders: httpHeaders) as List<dynamic>?;
    return decodedResponse?.map((json) => EventShort.fromJson(json)).toList() ??
        [];
  }

  @override
  Future<List<UnityShort>> fetchUnitiesForArtistById(
      {required int id, required Map<String, String> httpHeaders}) async {
    final decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath: 'artist/public/$id/unities',
        httpHeaders: httpHeaders) as List<dynamic>?;
    return decodedResponse?.map((json) => UnityShort.fromJson(json)).toList() ??
        [];
  }
}
