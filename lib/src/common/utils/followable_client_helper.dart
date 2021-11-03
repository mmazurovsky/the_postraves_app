import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/models/fulls/artist_full.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

abstract class FollowableClientHelper<
    FOLLOWABLE extends GeneralFollowableInterface> {
  String getEndpointForFollowable();
  FOLLOWABLE deserializeFollowable(dynamic json);
  String getEndpointAndPathForUserFollowing();
}

class ArtistShortClientHelper implements FollowableClientHelper<ArtistShort> {
  @override
  ArtistShort deserializeFollowable(json) {
    return ArtistShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.ARTIST.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.ARTIST.endpoint}';
  }
}

class ArtistFullClientHelper implements FollowableClientHelper<ArtistFull> {
  @override
  ArtistFull deserializeFollowable(json) {
    return ArtistFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.ARTIST.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.ARTIST.endpoint}';
  }
}

class EventShortClientHelper implements FollowableClientHelper<EventShort> {
  @override
  EventShort deserializeFollowable(json) {
    return EventShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.EVENT.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.EVENT.endpoint}';
  }
}

class EventFullClientHelper implements FollowableClientHelper<EventFull> {
  @override
  EventFull deserializeFollowable(json) {
    return EventFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.EVENT.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.EVENT.endpoint}';
  }
}

class UnityShortClientHelper implements FollowableClientHelper<UnityShort> {
  @override
  UnityShort deserializeFollowable(json) {
    return UnityShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.UNITY.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.UNITY.endpoint}';
  }
}

class UnityFullClientHelper implements FollowableClientHelper<UnityFull> {
  @override
  UnityFull deserializeFollowable(json) {
    return UnityFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.UNITY.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.UNITY.endpoint}';
  }
}

class PlaceShortClientHelper implements FollowableClientHelper<PlaceShort> {
  @override
  PlaceShort deserializeFollowable(json) {
    return PlaceShort.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.PLACE.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.PLACE.endpoint}';
  }
}

class PlaceFullClientHelper implements FollowableClientHelper<PlaceFull> {
  @override
  PlaceFull deserializeFollowable(json) {
    return PlaceFull.fromJson(json);
  }

  @override
  String getEndpointForFollowable() {
    return FollowableType.PLACE.endpoint;
  }

  @override
  String getEndpointAndPathForUserFollowing() {
    return '${FollowableType.USER.endpoint}/myFollowing/${FollowableType.PLACE.endpoint}';
  }
}
