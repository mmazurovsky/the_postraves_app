import 'package:freezed_annotation/freezed_annotation.dart';
import '../shorts/artist_short.dart';
import '../shorts/event_short.dart';
import '../shorts/place_short.dart';
import '../shorts/unity_short.dart';

part 'aggregated_search_model.freezed.dart';

@freezed
class AggregatedSearchModel with _$AggregatedSearchModel {
  factory AggregatedSearchModel({
    required List<EventShort> foundEvents,
    required List<ArtistShort> foundArtists,
    required List<UnityShort> foundUnities,
    required List<PlaceShort> foundPlaces,
  }) = _AggregatedSeachModel;
}
