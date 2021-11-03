import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/models/related_to_event/timetable_for_scene.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';


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
  Future<List<ArtistShort>> fetchLineupForEventById(
      {required int id, required Map<String, String> httpHeaders}) async {
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'event/public/$id/lineup',
            httpHeaders: httpHeaders) as List<dynamic>?;
    final list =
        decodedResponse?.map((json) => ArtistShort.fromJson(json)).toList() ??
            [];
    return list;
  }

  @override
  Future<List<UnityShort>> fetchOrganizersForEventById(
      {required int id, required Map<String, String> httpHeaders}) async {
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'event/public/$id/organizers',
            httpHeaders: httpHeaders) as List<dynamic>?;
    final list =
        decodedResponse?.map((json) => UnityShort.fromJson(json)).toList() ??
            [];
    return list;
  }

  @override
  Future<List<TimetableForScene>> fetchTimetableForEventById(
      {required int id, required Map<String, String> httpHeaders}) async {
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
            endpointWithPath: 'event/public/$id/timetable',
            httpHeaders: httpHeaders) as List<dynamic>?;
    final list = decodedResponse
            ?.map((json) => TimetableForScene.fromJson(json))
            .toList() ??
        [];
    return list;
  }
}
