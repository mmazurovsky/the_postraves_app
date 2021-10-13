import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/modify_profile_screen.dart';
import 'core/navigation_bar/bottom_navigation_tab_item.dart';
import 'features/chart/ui/screens/charts_screen.dart';
import 'features/profile/ui/screen/auth_on_action_screen_resolver.dart';
import 'features/profile/ui/screen/profile_screen.dart';
import 'features/profile/ui/screen/sign_in_with_email_and_link_screen.dart';
import 'features/search/ui/screens/search_screen.dart';
import 'features/shows/ui/screens/shows_screen.dart';
import 'features/timetable/dto/timetable_for_scene_dto.dart';
import 'features/timetable/ui/screens/event_timetable_screen.dart';
import 'features/wiki/state/event_cubit/event_cubit.dart';
import 'models/dto/image_dimensions.dart';
import 'features/wiki/ui/screens/artist_screen.dart';
import 'features/wiki/ui/screens/event_screen.dart';
import 'features/wiki/ui/screens/place_screen.dart';
import 'features/wiki/ui/screens/unity_screen.dart';
import 'features/wiki/ui/screens/wiki_share_screen.dart';
import 'models/dto/wiki_data_dto.dart';
import 'models/enum/wiki_rating_type.dart';
import 'models/geo/country.dart';

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
  static const String modifyUser = '/modifyUser';
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
                args!['wikiDataDto'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.eventTimetable) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => EventTimetableScreen(
                eventId: args!['eventId'],
                eventName: args['eventName'],
                initialTimetable: args['timetableDto'],
                eventBlocProvider: args['eventBlocProvider'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.artist) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ArtistScreen(
                args!['wikiDataDto'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.place) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PlaceScreen(
                args!['wikiDataDto'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.unity) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => UnityScreen(
                args!['wikiDataDto'],
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
              ));
    } else if (routeSettings.name == MyNavigationRoutes.actionResolver) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => AuthOnActionScreenResolver());
    } else if (routeSettings.name == MyNavigationRoutes.modifyUser) {
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
                height: imageHeight.toDouble(),
                width: imageWidth.toDouble(),
              )
            : null;

    final navigationRouteOfLink = deepLink.path;
    final followableType =
        WikiFollowableTypeStatic.getWikiFollowableTypeByNavigationRoute(
            navigationRouteOfLink)!; //todo exception handling when null

    final wikiDataDto = WikiDataDto(
        name: name,
        imageLink: imageLink,
        imageDimensions: imageDimensions,
        id: id,
        country: country,
        type: followableType);

    final currentContext = currentTab.tabNavigatorKey.currentContext!;

    pushFollowable(context: currentContext, wikiDataDto: wikiDataDto);
  }

  static void pushFollowable({
    required BuildContext context,
    required WikiDataDto wikiDataDto,
  }) {
    Navigator.of(context)
        .pushNamed(wikiDataDto.type.navigationRoute, arguments: {
      'wikiDataDto': wikiDataDto,
    });
  }

  static void pushShareWiki({
    required BuildContext context,
    required Uri shareLink,
    required WikiDataDto wikiData,
  }) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.wikiShare, arguments: {
      'shareLink': shareLink,
      'wikiData': wikiData,
    });
  }

  static void pushTimetable(
      {required BuildContext context,
      required int eventId,
      required String eventName,
      required List<TimetableForSceneDto> timetableDto,
      required EventCubit eventBlocProvider,
      }) {
    Navigator.of(context)
        .pushNamed(MyNavigationRoutes.eventTimetable, arguments: {
      'eventId': eventId,
      'eventName': eventName,
      'timetableDto': timetableDto,
      'eventBlocProvider': eventBlocProvider,
    });
  }

  static void pushModifyUser(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.modifyUser);
  }
}
