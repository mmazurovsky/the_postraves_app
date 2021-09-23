import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/wiki_rating_type.dart';
import '../geo/country.dart';
import '../interfaces/data_interfaces.dart';
import '../shorts/artist_short.dart';
import '../shorts/event_short.dart';
import '../shorts/place_short.dart';
import '../shorts/unity_short.dart';


part 'unified_search_model.freezed.dart';
part 'unified_search_model.g.dart';

@freezed
class UnifiedSearchModel with _$UnifiedSearchModel implements SimpleFollowableInterface {
  const UnifiedSearchModel._();
  const factory UnifiedSearchModel({
    required int id,
    required String name,
    required String? imageLink,
    required WikiFollowableType type,
    required DateTime updatedDateTime,
    @Default(null) Country? country,
  }) = _UnifiedSearchModel;

  factory UnifiedSearchModel.fromJson(Map<String, dynamic> json) =>
      _$UnifiedSearchModelFromJson(json);

  factory UnifiedSearchModel.fromShortArtist(
      ArtistShort shortEntity, DateTime dateTimeUpdated) {
    return UnifiedSearchModel(
      id: shortEntity.id,
      name: shortEntity.name,
      imageLink: shortEntity.imageLink,
      updatedDateTime: dateTimeUpdated,
      type: WikiFollowableType.ARTIST,
      country: shortEntity.country,
    );
  }

  factory UnifiedSearchModel.fromShortUnity(
      UnityShort shortEntity, DateTime dateTimeUpdated) {
    return UnifiedSearchModel(
      id: shortEntity.id,
      name: shortEntity.name,
      imageLink: shortEntity.imageLink,
      updatedDateTime: dateTimeUpdated,
      type: WikiFollowableType.UNITY,
      country: shortEntity.country,
    );
  }

  factory UnifiedSearchModel.fromShortPlace(
      PlaceShort shortEntity, DateTime dateTimeUpdated) {
    return UnifiedSearchModel(
      id: shortEntity.id,
      name: shortEntity.name,
      imageLink: shortEntity.imageLink,
      updatedDateTime: dateTimeUpdated,
      type: WikiFollowableType.PLACE,
      country: shortEntity.city.country,
    );
  }

  factory UnifiedSearchModel.fromShortEvent(
      EventShort shortEntity, DateTime dateTimeUpdated) {
    return UnifiedSearchModel(
      id: shortEntity.id,
      name: shortEntity.name,
      imageLink: shortEntity.imageLink,
      updatedDateTime: dateTimeUpdated,
      type: WikiFollowableType.EVENT,
      country: shortEntity.place.city.country,
    );
  }
}
