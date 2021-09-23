import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../my_navigation.dart';


enum WikiFollowableType {
  ARTIST,
  UNITY,
  PLACE,
  EVENT,
  USER,
}

extension TypeOfUnifiedRatingModelExtension on WikiFollowableType {
  static _getNameSingularMapping(BuildContext context, WikiFollowableType type) => {
        WikiFollowableType.ARTIST:
            AppLocalizations.of(context)!.artistEntityNameSingular,
        WikiFollowableType.UNITY:
            AppLocalizations.of(context)!.unityEntityNameSingular,
        WikiFollowableType.PLACE:
            AppLocalizations.of(context)!.placeEntityNameSingular,
        WikiFollowableType.EVENT:
            AppLocalizations.of(context)!.eventEntityNameSingular,
        WikiFollowableType.USER: AppLocalizations.of(context)!.userEntityNameSingular
      }[type];

  static const Map<WikiFollowableType, String> _endpoints = {
    WikiFollowableType.ARTIST: 'artist',
    WikiFollowableType.UNITY: 'unity',
    WikiFollowableType.PLACE: 'place',
    WikiFollowableType.EVENT: 'event',
    WikiFollowableType.USER: 'user',
  };

  static const Map<WikiFollowableType, String> _navigationRoutes = {
    WikiFollowableType.ARTIST: MyNavigationRoutes.artist,
    WikiFollowableType.UNITY: MyNavigationRoutes.unity,
    WikiFollowableType.PLACE: MyNavigationRoutes.place,
    WikiFollowableType.EVENT: MyNavigationRoutes.event,
    WikiFollowableType.USER: MyNavigationRoutes.user,
  };

  String getNameSingular(BuildContext context) =>
      _getNameSingularMapping(context, this);
  String get endpoint => _endpoints[this]!;
  String get navigationRoute => _navigationRoutes[this]!;
}
