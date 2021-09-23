import '../../../models/enum/wiki_rating_type.dart';
import '../../../models/related_to_search/aggregated_search_model.dart';
import '../../../models/shorts/artist_short.dart';
import '../../../models/shorts/event_short.dart';
import '../../../models/shorts/place_short.dart';
import '../../../models/shorts/unity_short.dart';

import '../../../core/client/remote_client.dart';

abstract class SearchRemoteDataSource {
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue, required Map<String, String> httpHeaders});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  @override
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue,
      required Map<String, String> httpHeaders}) async {
    final dynamic requestEvents = RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${WikiFollowableType.EVENT.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final dynamic requestArtists = RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${WikiFollowableType.ARTIST.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final dynamic requestUnities = RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${WikiFollowableType.UNITY.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final dynamic requestPlaces = RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath:
          '${WikiFollowableType.PLACE.endpoint}/public/search/$searchValue',
      httpHeaders: httpHeaders,
    );

    final responseEvents = await requestEvents;
    final responseArtists = await requestArtists;
    final responseUnities = await requestUnities;
    final responsePlaces = await requestPlaces;

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
