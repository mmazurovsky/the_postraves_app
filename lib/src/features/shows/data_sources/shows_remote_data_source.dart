import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/related_to_event/shows_by_date.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

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
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
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
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath: 'event/public/relevantByRating',
      queryParameters: {'cityName': city.name},
      httpHeaders: httpHeaders,
    );

    return decodedResponse
        .map<EventShort>((jsonElement) => EventShort.fromJson(jsonElement))
        .toList();
  }
}
