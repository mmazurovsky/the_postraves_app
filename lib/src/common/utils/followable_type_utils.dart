import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';
import 'package:the_postraves_package/dto/followable_type.dart';

import '../../my_navigation.dart';

class FollowableTypeUtils {
  static FollowableType? getFollowableTypeByNavigationRoute(String route) => {
        MyNavigationRoutes.artist: FollowableType.ARTIST,
        MyNavigationRoutes.unity: FollowableType.UNITY,
        MyNavigationRoutes.place: FollowableType.PLACE,
        MyNavigationRoutes.event: FollowableType.EVENT,
        MyNavigationRoutes.user: FollowableType.USER,
      }[route];

  static getNavigationRouteForType(FollowableType type) => {
    FollowableType.ARTIST: MyNavigationRoutes.artist,
    FollowableType.UNITY: MyNavigationRoutes.unity,
    FollowableType.PLACE: MyNavigationRoutes.place,
    FollowableType.EVENT: MyNavigationRoutes.event,
    FollowableType.USER: MyNavigationRoutes.user
  }[type];

  static getTranslationSingularForType(FollowableType type) => {
        FollowableType.ARTIST: 'artistEntityNameSingular'.tr(),
        FollowableType.UNITY: 'unityEntityNameSingular'.tr(),
        FollowableType.PLACE: 'placeEntityNameSingular'.tr(),
        FollowableType.EVENT: 'eventEntityNameSingular'.tr(),
        FollowableType.USER: 'userEntityNameSingular'.tr(),
      }[type];

    static getTranslationPluralForType(FollowableType type) => {
        FollowableType.ARTIST: 'artistEntityNamePlural'.tr(),
        FollowableType.UNITY: 'unityEntityNamePlural'.tr(),
        FollowableType.PLACE: 'placeEntityNamePlural'.tr(),
        FollowableType.EVENT: 'eventEntityNamePlural'.tr(),
        FollowableType.USER: 'userEntityNamePlural'.tr(),
      }[type];
}
