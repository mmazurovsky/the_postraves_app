import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/models/related_to_search/aggregated_search_model.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

abstract class SearchRemoteDataSource {
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue, required Map<String, String> httpHeaders});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  @override
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue,
      required Map<String, String> httpHeaders}) async {
    final requestEvents = LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${FollowableType.EVENT.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final requestArtists = LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${FollowableType.ARTIST.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final requestUnities = LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${FollowableType.UNITY.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final requestPlaces = LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${FollowableType.PLACE.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final responseEvents = await requestEvents as List<dynamic>;
    final responseArtists = await requestArtists as List<dynamic>;
    final responseUnities = await requestUnities as List<dynamic>;
    final responsePlaces = await requestPlaces as List<dynamic>;

    final decodedEvents =
        responseEvents.map((json) => EventShort.fromJson(json)).toList();
    final decodedArtists =
        responseArtists.map((json) => ArtistShort.fromJson(json)).toList();
    final decodedUnities =
        responseUnities.map((json) => UnityShort.fromJson(json)).toList();
    final decodedPlaces =
        responsePlaces.map((json) => PlaceShort.fromJson(json)).toList();

    final response = AggregatedSearchModel(
        foundEvents: decodedEvents,
        foundArtists: decodedArtists,
        foundUnities: decodedUnities,
        foundPlaces: decodedPlaces);

    return response;
  }
}
