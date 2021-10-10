import '../../models/enum/wiki_rating_type.dart';
import '../../models/fulls/artist_full.dart';
import '../../models/fulls/event_full.dart';
import '../../models/fulls/place_full.dart';
import '../../models/fulls/unity_full.dart';
import '../../models/interfaces/data_interfaces.dart';
import '../../models/shorts/artist_short.dart';
import '../../models/shorts/event_short.dart';
import '../../models/shorts/place_short.dart';
import '../../models/shorts/unity_short.dart';

abstract class FollowableClientHelper<FOLLOWABLE extends GeneralFollowableInterface> {
  String getEndpointForFollowable();
  FOLLOWABLE deserializeFollowable(dynamic json);
}

class ArtistShortClientHelper implements FollowableClientHelper<ArtistShort> {
  @override
  ArtistShort deserializeFollowable(json) {
    return ArtistShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.ARTIST.endpoint;
  }
}

class ArtistFullClientHelper implements FollowableClientHelper<ArtistFull> {
  @override
  ArtistFull deserializeFollowable(json) {
    return ArtistFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.ARTIST.endpoint;
  }
}

class EventShortClientHelper implements FollowableClientHelper<EventShort> {
  @override
  EventShort deserializeFollowable(json) {
    return EventShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.EVENT.endpoint;
  }
}

class EventFullClientHelper implements FollowableClientHelper<EventFull> {
  @override
  EventFull deserializeFollowable(json) {
    return EventFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.EVENT.endpoint;
  }
}

class UnityShortClientHelper implements FollowableClientHelper<UnityShort> {
  @override
  UnityShort deserializeFollowable(json) {
    return UnityShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.UNITY.endpoint;
  }
}

class UnityFullClientHelper implements FollowableClientHelper<UnityFull> {
  @override
  UnityFull deserializeFollowable(json) {
    return UnityFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.UNITY.endpoint;
  }
}

class PlaceShortClientHelper implements FollowableClientHelper<PlaceShort> {
  @override
  PlaceShort deserializeFollowable(json) {
    return PlaceShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.PLACE.endpoint;
  }
}

class PlaceFullClientHelper implements FollowableClientHelper<PlaceFull> {
  @override
  PlaceFull deserializeFollowable(json) {
    return PlaceFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return WikiFollowableType.PLACE.endpoint;
  }
}