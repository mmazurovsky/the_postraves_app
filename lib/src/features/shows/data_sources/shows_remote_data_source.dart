import '../../../core/client/remote_client.dart';
import '../../../models/geo/city.dart';
import '../../../models/related_to_event/shows_by_date.dart';
import '../../../models/shorts/event_short.dart';

abstract class ShowsRemoteDataSource {
  Future<List<ShowsByDate>> fetchEventsByDate(
      {required City city, required Map<String, String> httpHeaders});
  Future<List<EventShort>> fetchEventsByRating(
      {required City city, required Map<String, String> httpHeaders});
}

class ShowsRemoteDataSourceImpl<T> implements ShowsRemoteDataSource {
  @override
  Future<List<ShowsByDate>> fetchEventsByDate(
      {required City city, required Map<String, String> httpHeaders}) async {
    final dynamic decodedResponse =
        await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: 'event/public/relevantByDate',
      queryParameters: {'cityName': city.name},
      httpHeaders: httpHeaders,
    );

    final resp = decodedResponse
        .map<ShowsByDate>((jsonElement) => ShowsByDate.fromJson(jsonElement))
        .toList();

    return resp;
  }

  @override
  Future<List<EventShort>> fetchEventsByRating(
      {required City city, required Map<String, String> httpHeaders}) async {
    final dynamic decodedResponse =
        await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: 'event/public/relevantByRating',
      queryParameters: {'cityName': city.name},
      httpHeaders: httpHeaders,
    );

    return decodedResponse
        .map<EventShort>((jsonElement) => EventShort.fromJson(jsonElement))
        .toList();
  }
}
