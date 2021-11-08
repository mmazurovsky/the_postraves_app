import 'package:the_postraves_package/followable/data_sources/artist_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/event_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/place_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/unity_remote_data_source.dart';
import 'package:the_postraves_package/models/related_to_search/aggregated_search_model.dart';

abstract class SearchRemoteDataSource {
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue, required Map<String, String> httpHeaders});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ArtistRemoteDataSource _artistRemoteDataSource;
  final EventRemoteDataSource _eventRemoteDataSource;
  final PlaceRemoteDataSource _placeRemoteDataSource;
  final UnityRemoteDataSource _unityRemoteDataSource;

  SearchRemoteDataSourceImpl(
      this._artistRemoteDataSource,
      this._eventRemoteDataSource,
      this._placeRemoteDataSource,
      this._unityRemoteDataSource);

  //* There is search by name in each repo but it doesn't used here because it awaits
  @override
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue,
      required Map<String, String> httpHeaders}) async {
    // final requestEvents = _localizedGetRequest(
    //   endpointWithPath:
    //       '${FollowableType.EVENT.endpoint}/public/search/$searchValue',
    //   httpHeaders: httpHeaders,
    // );

    // final requestArtists = _localizedGetRequest(
    //   endpointWithPath:
    //       '${FollowableType.ARTIST.endpoint}/public/search/$searchValue',
    //   httpHeaders: httpHeaders,
    // );

    // final requestUnities = _localizedGetRequest(
    //   endpointWithPath:
    //       '${FollowableType.UNITY.endpoint}/public/search/$searchValue',
    //   httpHeaders: httpHeaders,
    // );

    // final requestPlaces = _localizedGetRequest(
    //   endpointWithPath:
    //       '${FollowableType.PLACE.endpoint}/public/search/$searchValue',
    //   httpHeaders: httpHeaders,
    // );

    // final responseEvents = await requestEvents as List<dynamic>?;
    // final responseArtists = await requestArtists as List<dynamic>?;
    // final responseUnities = await requestUnities as List<dynamic>?;
    // final responsePlaces = await requestPlaces as List<dynamic>?;

    // final decodedEvents =
    //     responseEvents?.map((json) => EventShort.fromJson(json)).toList() ?? [];
    // final decodedArtists =
    //     responseArtists?.map((json) => ArtistShort.fromJson(json)).toList() ??
    //         [];
    // final decodedUnities =
    //     responseUnities?.map((json) => UnityShort.fromJson(json)).toList() ??
    //         [];
    // final decodedPlaces =
    //     responsePlaces?.map((json) => PlaceShort.fromJson(json)).toList() ?? [];

    final requestArtists = _artistRemoteDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final requestEvents = _eventRemoteDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final requestPlaces = _placeRemoteDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final requestUnities = _unityRemoteDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final decodedArtists = await requestArtists;
    final decodedEvents = await requestEvents;
    final decodedPlaces = await requestPlaces;
    final decodedUnities = await requestUnities;

    final response = AggregatedSearchModel(
        foundEvents: decodedEvents,
        foundArtists: decodedArtists,
        foundUnities: decodedUnities,
        foundPlaces: decodedPlaces);

    return response;
  }
}
