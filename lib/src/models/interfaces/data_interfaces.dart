import 'package:flutter/widgets.dart';
import '../enum/wiki_rating_type.dart';
import '../geo/country.dart';

abstract class BaseIdInterface {
  int get id;
}

abstract class BaseNameInterface {
  String get name;
}

abstract class LocationInterface {
  String get countryEmoji;
  Country get country;
  String get localName;
}

abstract class EntityNamesInterface {
  String getEntityNameSingularFormString(BuildContext context);
  String getEntityNamePluralFormString(BuildContext context);
}

// abstract class EntityEndpointInterface {
//   String getEntityEndpoint();
// }

abstract class SimpleFollowableInterface
    implements BaseIdInterface, BaseNameInterface {
  String? get imageLink;
  Country? get country;
  WikiFollowableType get type;
}

abstract class FollowableInterface
    implements BaseIdInterface, BaseNameInterface, EntityNamesInterface {
  String? get imageLink;
  Country? get country;
  int get overallFollowers;
  int get weeklyFollowers;
  bool get isFollowed;
  Map<String, dynamic> toJson();

  // // todo not clean code
  // static SR deserializeShortModel<SR extends BaseFollowableModel>(dynamic json) {
  //   if (SR == ArtistShort) {
  //     return ArtistShort.fromJson(json) as SR;
  //   } else if (SR == EventShort) {
  //     return EventShort.fromJson(json) as SR;
  //   } else if (SR == UnityShort) {
  //     return UnityShort.fromJson(json) as SR;
  //   } else if (SR == PlaceShort) {
  //     return PlaceShort.fromJson(json) as SR;
  //   } else {
  //     return UnifiedModel.fromJson(json) as SR;
  //   }
  // }

  // // todo not clean code
  // static R deserealizeFullRatingModel<R extends BaseFollowableModel>(dynamic json) {
  //   if (R == Artist) {
  //     return Artist.fromJson(json) as R;
  //   } else if (R == Event) {
  //     return Event.fromJson(json) as R;
  //   } else if (R == Unity) {
  //     return Unity.fromJson(json) as R;
  //   } else if (R == Place) {
  //     return Place.fromJson(json) as R;
  //   } else
  //     return null;
  // }

  // // todo not clean code
  // static String getEndpointForShortModel<SR extends BaseFollowableModel>() {
  //   if (SR == ArtistShort) {
  //     return WikiRatingType.ARTIST.endpoint;
  //   } else if (SR == EventShort) {
  //     return WikiRatingType.EVENT.endpoint;
  //   } else if (SR == PlaceShort) {
  //     return WikiRatingType.PLACE.endpoint;
  //   } else if (SR == UnityShort) {
  //     return WikiRatingType.UNITY.endpoint;
  //   } else
  //     //todo specific exception
  //     throw Exception();
  // }

  // // todo not clean code
  // static String getEndpointForFullModel<R extends BaseFollowableModel>() {
  //   if (R == Artist) {
  //     return WikiRatingType.ARTIST.endpoint;
  //   } else if (R == Event) {
  //     return WikiRatingType.EVENT.endpoint;
  //   } else if (R == Place) {
  //     return WikiRatingType.PLACE.endpoint;
  //   } else if (R == Unity) {
  //     return WikiRatingType.UNITY.endpoint;
  //   } else
  //     //todo specific exception
  //     throw Exception();
  // }
}
