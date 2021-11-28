import 'package:the_postraves_package/followable/data_sources/artist_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/event_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/general_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/place_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/unity_remote_data_source.dart';
import 'package:the_postraves_package/followable/repository/general_repository.dart';
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
  final GeneralRemoteDataSource<ArtistShort> _artistSearchDataSource;
  final GeneralRemoteDataSource<EventShort> _eventSearchDataSource;
  final GeneralRemoteDataSource<PlaceShort> _placeSearchDataSource;
  final GeneralRemoteDataSource<UnityShort> _unitySearchDataSource;

  SearchRemoteDataSourceImpl(
      this._artistSearchDataSource,
      this._eventSearchDataSource,
      this._placeSearchDataSource,
      this._unitySearchDataSource);

  //* There is search by name in each repo but it doesn't used here because it awaits
  @override
  Future<AggregatedSearchModel> searchByAllFollowables(
      {required String searchValue,
      required Map<String, String> httpHeaders}) async {
    final requestArtists = _artistSearchDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final requestEvents = _eventSearchDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final requestPlaces = _placeSearchDataSource.searchByName(
      searchValue: searchValue,
      httpHeaders: httpHeaders,
    );

    final requestUnities = _unitySearchDataSource.searchByName(
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
