import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

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
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'unity/public/$id/events',
            httpHeaders: httpHeaders) as List<dynamic>?;
    return decodedResponse?.map((json) => EventShort.fromJson(json)).toList() ??
        [];
  }

  @override
  Future<List<ArtistShort>> fetchArtistsForUnityById(
      {required int id, required Map<String, String> httpHeaders}) async {
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'unity/public/$id/artists',
            httpHeaders: httpHeaders) as List<dynamic>?;
    return decodedResponse
            ?.map((json) => ArtistShort.fromJson(json))
            .toList() ??
        [];
  }
}
