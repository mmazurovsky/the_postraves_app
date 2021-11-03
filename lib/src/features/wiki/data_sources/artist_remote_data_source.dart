import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';


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
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'artist/public/$id/events',
            httpHeaders: httpHeaders) as List<dynamic>?;
    return decodedResponse?.map((json) => EventShort.fromJson(json)).toList() ??
        [];
  }

  @override
  Future<List<UnityShort>> fetchUnitiesForArtistById(
      {required int id, required Map<String, String> httpHeaders}) async {
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'artist/public/$id/unities',
            httpHeaders: httpHeaders) as List<dynamic>?;
    return decodedResponse?.map((json) => UnityShort.fromJson(json)).toList() ??
        [];
  }
}
