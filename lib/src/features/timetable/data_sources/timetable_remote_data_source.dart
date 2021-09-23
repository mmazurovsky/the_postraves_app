import '../../../models/related_to_event/timetable_for_scene.dart';

import '../../../core/client/remote_client.dart';


abstract class TimetableRemoteDataSource {
  Future<List<TimetableForScene>> fetchTimetable(
      {required int eventId, required Map<String, String> httpHeaders});
}

class TimetableRemoteDataSourceImpl implements TimetableRemoteDataSource {
  @override
  Future<List<TimetableForScene>> fetchTimetable(
      {required int eventId, required Map<String, String> httpHeaders}) async {
    final dynamic decodedResponse =
        await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: 'public/events/$eventId/timetable',
      httpHeaders: httpHeaders,
    );

    final resp = decodedResponse
        .map<TimetableForScene>(
            (jsonElement) => TimetableForScene.fromJson(jsonElement))
        .toList();

    return resp;
  }
}
