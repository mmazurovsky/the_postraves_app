import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/modify_profile_screen.dart';
import 'core/navigation_bar/bottom_navigation_tab_item.dart';
import 'models/related_to_search/unified_search_model.dart';
import 'features/chart/ui/screens/charts_screen.dart';
import 'features/profile/ui/screen/auth_on_action_screen_resolver.dart';
import 'features/profile/ui/screen/profile_screen.dart';
import 'features/profile/ui/screen/sign_in_with_email_and_link_screen.dart';
import 'features/search/ui/screens/search_screen.dart';
import 'features/shows/ui/screens/shows_screen.dart';
import 'features/timetable/dto/timetable_for_scene_dto.dart';
import 'features/timetable/ui/screens/event_timetable_screen.dart';
import 'features/wiki/dto/wiki_data_dto.dart';
import 'core/utils/image_dimensions.dart';
import 'features/wiki/ui/screens/artist_screen.dart';
import 'features/wiki/ui/screens/event_screen.dart';
import 'features/wiki/ui/screens/place_screen.dart';
import 'features/wiki/ui/screens/unity_screen.dart';
import 'features/wiki/ui/screens/wiki_share_screen.dart';
import 'models/enum/wiki_rating_type.dart';
import 'models/geo/country.dart';
import 'models/interfaces/data_interfaces.dart';
import 'models/shorts/artist_short.dart';
import 'models/shorts/event_short.dart';
import 'models/shorts/place_short.dart';
import 'models/shorts/unity_short.dart';

class MyNavigationRoutes {
  static const String shows = 'shows';
  static const String ratings = 'ratings';
  static const String search = '/search';
  static const String event = '/event';
  static const String eventTimetable = 'event-timetable';
  static const String artist = '/artist';
  static const String place = '/place';
  static const String unity = '/unity';
  static const String profileResolver = 'profile-resolver';
  static const String actionResolver = 'action-resolver';
  // static const String profile = 'profile';
  // static const String signInMethods = '/signInMethods';
  // static const String signInWithEmail = '/signInWithEmail';
  static const String wikiShare = '/wikiShare';
  static const String user = '/user';
  static const String updateUser = '/updateUser';
  static const String signInWithEmailLink = '/sign-in-with-email-link';
  // static const String signInWithSms = '/sign-in-with-sms';
  // static const String signInEnterSmsCode = '/sign-in-enter-sms-code';
}

class MyNavigator extends StatelessWidget {
  const MyNavigator({
    required this.navigatorKey,
    required this.activeBottomTab,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final String activeBottomTab;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: activeBottomTab,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map<String, dynamic>?;

    if (routeSettings.name == MyNavigationRoutes.shows) {
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => ShowsScreen());
    } else if (routeSettings.name == MyNavigationRoutes.ratings) {
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => ChartsScreen());
    } else if (routeSettings.name == MyNavigationRoutes.search) {
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SearchScreen());
    } else if (routeSettings.name == MyNavigationRoutes.profileResolver) {
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => ProfileScreenResolver());
    } else if (routeSettings.name == MyNavigationRoutes.signInWithEmailLink) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SignInWithEmailAndLinkScreen());
    }

    // else if (routeSettings.name == MyNavigationRoutes.profile) {
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_) => ProfileScreen());
    // }
    else if (routeSettings.name == MyNavigationRoutes.event) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => EventScreen(
                eventImageLink: args!['imageLink'],
                eventId: args['id'],
                eventName: args['name'],
                imageDimensions: args['imageDimensions'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.eventTimetable) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => EventTimetableScreen(
                eventId: args!['eventId'],
                eventName: args['eventName'],
                timetable: args['timetableDto'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.artist) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ArtistScreen(
                artistId: args!['id'],
                artistName: args['name'],
                country: args['country'],
                artistImageLink: args['imageLink'],
                imageDimensions: args['imageDimensions'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.place) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PlaceScreen(
                placeId: args!['id'],
                placeName: args['name'],
                country: args['country'],
                placeImageLink: args['imageLink'],
                imageDimensions: args['imageDimensions'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.unity) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => UnityScreen(
                unityId: args!['id'],
                unityName: args['name'],
                country: args['country'],
                unityImageLink: args['imageLink'],
                imageDimensions: args['imageDimensions'],
              ));
    }
    // else if (routeSettings.name == MyNavigationRoutes.signInMethods) {
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => SignInMethodsScreen());
    // } else if (routeSettings.name == MyNavigationRoutes.signInWithEmail) {
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_) => SignInWithEmailAndPasswordScreen());
    // }
    else if (routeSettings.name == MyNavigationRoutes.wikiShare) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => WikiShareScreen(
                shareLink: args!['shareLink'],
                wikiData: args['wikiData'],
                imageDimensions: args['imageDimensions'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.actionResolver) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => AuthOnActionScreenResolver());
    } else if (routeSettings.name == MyNavigationRoutes.updateUser) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ModifyProfileScreen(),
      );
    } else {
      return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
              child: Text('Navigation error'),
            ),
          ),
        );
      },
    );
  }
}

class NavigatorFunctions {
  static void pushFollowableFromDynamicLink({
    required TabItem currentTab,
    required Uri deepLink,
  }) {
    final id = int.parse(deepLink.queryParameters['id']!);
    final name = deepLink.queryParameters['name']!;
    final countryNameInLink = deepLink.queryParameters['countryName'];
    final countryLocalizedNameInLink =
        deepLink.queryParameters['countryLocalizedName'];
    final countryEmojiCodeInLink = deepLink.queryParameters['countryEmojiCode'];
    final country = countryNameInLink != null &&
            countryLocalizedNameInLink != null &&
            countryEmojiCodeInLink != null
        ? Country(
            name: countryNameInLink,
            localName: countryLocalizedNameInLink,
            emojiCode: countryEmojiCodeInLink)
        : null;
    final imageLink = deepLink.queryParameters['imageLink'];
    final int? imageHeight = deepLink.queryParameters['imageHeight'] != null
        ? int.tryParse(deepLink.queryParameters['imageHeight']!)
        : null;
    final int? imageWidth = deepLink.queryParameters['imageWidth'] != null
        ? int.tryParse(deepLink.queryParameters['imageWidth']!)
        : null;
    final ImageDimensions? imageDimensions =
        imageHeight != null && imageWidth != null
            ? ImageDimensions(
                imageHeight.toDouble(),
                imageWidth.toDouble(),
              )
            : null;

    final navigationRouteOfLink = deepLink.path;

    // Map<String, dynamic> args = {
    //   'id': int.parse(deepLink.queryParameters['id']!),
    //   'name': deepLink.queryParameters['name'],
    //   'imageLink': deepLink.queryParameters['imageLink'],
    //   'country': country,
    //   'imageDimensions': imageDimensions
    // };

    // currentTab.tabNavigatorKey.currentState!.pushNamed(
    //   navigationRouteOfLink,
    //   arguments: args,
    // );

    final currentContext = currentTab.tabNavigatorKey.currentContext!;

    if (navigationRouteOfLink == MyNavigationRoutes.event) {
      pushEvent(
        context: currentContext,
        id: id,
        name: name,
        imageLink: imageLink,
        imageDimensions: imageDimensions,
      );
    } else if (navigationRouteOfLink == MyNavigationRoutes.artist) {
      pushArtist(
          context: currentContext,
          id: id,
          name: name,
          imageLink: imageLink,
          country: country,
          imageDimensions: imageDimensions);
    } else if (navigationRouteOfLink == MyNavigationRoutes.place) {
      pushPlace(
          context: currentContext,
          id: id,
          name: name,
          imageLink: imageLink,
          country: country,
          imageDimensions: imageDimensions);
    } else if (navigationRouteOfLink == MyNavigationRoutes.unity) {
      pushUnity(
          context: currentContext,
          id: id,
          name: name,
          imageLink: imageLink,
          country: country,
          imageDimensions: imageDimensions);
    }
  }

  static void pushEvent({
    required BuildContext context,
    required int id,
    required String name,
    required String? imageLink,
    required ImageDimensions? imageDimensions,
  }) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.event, arguments: {
      'imageLink': imageLink,
      'id': id,
      'name': name,
      'imageDimensions': imageDimensions,
    });
  }

  static void pushShareWiki({
    required BuildContext context,
    required Uri shareLink,
    required WikiDataDto wikiData,
    required ImageDimensions? imageDimensions,
  }) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.wikiShare, arguments: {
      'shareLink': shareLink,
      'wikiData': wikiData,
      'imageDimensions': imageDimensions,
    });
  }

  static void pushArtist(
      {required BuildContext context,
      required int id,
      required String name,
      required Country? country,
      required String? imageLink,
      required ImageDimensions? imageDimensions}) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.artist, arguments: {
      'id': id,
      'name': name,
      'country': country,
      'imageLink': imageLink,
      'imageDimensions': imageDimensions,
    });
  }

  static void pushPlace(
      {required BuildContext context,
      required int id,
      required String name,
      required Country? country,
      required String? imageLink,
      required ImageDimensions? imageDimensions}) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.place, arguments: {
      'id': id,
      'name': name,
      'country': country,
      'imageLink': imageLink,
      'imageDimensions': imageDimensions,
    });
  }

  static void pushUnity({
    required BuildContext context,
    required int id,
    required String name,
    required Country? country,
    required String? imageLink,
    required ImageDimensions? imageDimensions,
  }) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.unity, arguments: {
      'id': id,
      'name': name,
      'country': country,
      'imageLink': imageLink,
      'imageDimensions': imageDimensions,
    });
  }

  static void pushTimetable(
      {required BuildContext context,
      required int eventId,
      required String eventName,
      required List<TimetableForSceneDto> timetableDto}) {
    Navigator.of(context)
        .pushNamed(MyNavigationRoutes.eventTimetable, arguments: {
      'eventId': eventId,
      'eventName': eventName,
      'timetableDto': timetableDto,
    });
  }

  static void pushRatingEntity<T extends FollowableInterface>(
      BuildContext context, T unified, ImageDimensions? imageDimensions) {
    if (unified is ArtistShort) {
      pushArtist(
        context: context,
        id: unified.id,
        name: unified.name,
        country: unified.country,
        imageLink: unified.imageLink,
        imageDimensions: imageDimensions,
      );
    } else if (unified is EventShort) {
      pushEvent(
        imageLink: unified.imageLink,
        context: context,
        id: unified.id,
        name: unified.name,
        imageDimensions: imageDimensions,
      );
    } else if (unified is PlaceShort) {
      pushPlace(
        imageLink: unified.imageLink,
        context: context,
        id: unified.id,
        name: unified.name,
        country: unified.country,
        imageDimensions: imageDimensions,
      );
    } else if (unified is UnityShort) {
      pushUnity(
        imageLink: unified.imageLink,
        context: context,
        id: unified.id,
        name: unified.name,
        country: unified.country,
        imageDimensions: imageDimensions,
      );
    }
  }

  static void pushSearchEntity(
    BuildContext context,
    UnifiedSearchModel unified,
    ImageDimensions? imageDimensions,
  ) {
    if (unified.type == WikiFollowableType.ARTIST) {
      pushArtist(
        context: context,
        id: unified.id,
        name: unified.name,
        country: unified.country,
        imageLink: unified.imageLink,
        imageDimensions: imageDimensions,
      );
    } else if (unified.type == WikiFollowableType.EVENT) {
      pushEvent(
        context: context,
        imageLink: unified.imageLink,
        id: unified.id,
        name: unified.name,
        imageDimensions: imageDimensions,
      );
    } else if (unified.type == WikiFollowableType.PLACE) {
      pushPlace(
        context: context,
        imageLink: unified.imageLink,
        id: unified.id,
        name: unified.name,
        country: unified.country,
        imageDimensions: imageDimensions,
      );
    } else if (unified.type == WikiFollowableType.UNITY) {
      pushUnity(
        imageLink: unified.imageLink,
        context: context,
        id: unified.id,
        name: unified.name,
        country: unified.country,
        imageDimensions: imageDimensions,
      );
    }
  }

  static void pushModifyUser(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.updateUser);
  }
}
