import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/common/utils/followable_type_utils.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/profile_resolver.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../../features/chart/data/chart_type.dart';
import '../../features/chart/ui/screens/charts_screen.dart';
import '../../features/chart/ui/screens/extended_chart_screen.dart';
import '../../features/profile/ui/screen/auth_on_action_screen_resolver.dart';
import '../../features/profile/ui/screen/following_screen.dart';
import '../../features/profile/ui/screen/modify_profile_screen.dart';
import '../../features/profile/ui/screen/profile_screen.dart';
import '../../features/profile/ui/screen/sign_in_with_email_and_link_screen.dart';
import '../../features/search/ui/screens/search_screen.dart';
import '../../features/shows/ui/screens/shows_screen.dart';
import '../../features/timetable/dto/timetable_for_scene_dto.dart';
import '../../features/timetable/ui/screens/event_timetable_screen.dart';
import '../../features/wiki/ui/screens/artist_screen.dart';
import '../../features/wiki/ui/screens/event_screen.dart';
import '../../features/wiki/ui/screens/place_screen.dart';
import '../../features/wiki/ui/screens/unity_screen.dart';
import '../../features/wiki/ui/screens/wiki_share_screen.dart';

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
  static const String userFollowing = '/userFollowing';
  static const String extendedChart = '/extendedChart';
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
    } else if (routeSettings.name == MyNavigationRoutes.event) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => EventScreen(
                args!['FollowableData'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.eventTimetable) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => EventTimetableScreen(
                eventId: args!['eventId'],
                eventName: args['eventName'],
                initialTimetable: args['timetableDto'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.artist) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ArtistScreen(
                args!['FollowableData'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.place) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PlaceScreen(
                args!['FollowableData'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.unity) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => UnityScreen(
                args!['FollowableData'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.wikiShare) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => WikiShareScreen(
                shareLink: args!['shareLink'],
                followableData: args['followableData'],
              ));
    } else if (routeSettings.name == MyNavigationRoutes.actionResolver) {
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthOnActionScreenResolver());
    } else if (routeSettings.name == MyNavigationRoutes.modifyUser) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ModifyProfileScreen(),
      );
    } else if (routeSettings.name == MyNavigationRoutes.userFollowing) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FollowingScreen(),
      );
    } else if (routeSettings.name == MyNavigationRoutes.extendedChart) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ExtendedChartScreen(
          chartType: args!['chartType'],
          initialFollowables: args['followables'],
        ),
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
              child: Text('Navigation error'), // TODO exception
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
    final double? imageHeight = deepLink.queryParameters['imageHeight'] != null
        ? double.tryParse(deepLink.queryParameters['imageHeight']!)
        : null;
    final double? imageWidth = deepLink.queryParameters['imageWidth'] != null
        ? double.tryParse(deepLink.queryParameters['imageWidth']!)
        : null;
    final ImageDimensions? imageDimensions =
        imageHeight != null && imageWidth != null
            ? ImageDimensions(
                height: imageHeight,
                width: imageWidth,
              )
            : null;

    final navigationRouteOfLink = deepLink.path;
    final followableType =
        FollowableTypeUtils.getFollowableTypeByNavigationRoute(
            navigationRouteOfLink);

    // when null should not push, it is not tested
    if (followableType == null) {
      return;
    }

    final followableData = FollowableData(
        name: name,
        imageLink: imageLink,
        imageDimensions: imageDimensions,
        id: id,
        country: country,
        type: followableType);

    final currentContext = currentTab.tabNavigatorKey.currentContext!;

    pushFollowable(context: currentContext, followableData: followableData);
  }

  static void pushFollowable({
    required BuildContext context,
    required FollowableData followableData,
  }) {
    Navigator.of(context).pushNamed(
      FollowableTypeUtils.getNavigationRouteForType(followableData.type),
        arguments: {
          'FollowableData': followableData,
        });
  }

  static void pushShareWiki({
    required BuildContext context,
    required Uri shareLink,
    required FollowableData followableData,
  }) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.wikiShare, arguments: {
      'shareLink': shareLink,
      'followableData': followableData,
    });
  }

  static void pushTimetable({
    required BuildContext context,
    required int eventId,
    required String eventName,
    required List<TimetableForSceneDto> timetableDto,
  }) {
    Navigator.of(context)
        .pushNamed(MyNavigationRoutes.eventTimetable, arguments: {
      'eventId': eventId,
      'eventName': eventName,
      'timetableDto': timetableDto,
    });
  }

  static void pushModifyUser(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.modifyUser);
  }

  static void pushExtendedChart<T extends GeneralFollowableInterface>(
      BuildContext context, ChartType chartType, List<T> entities) {
    Navigator.of(context)
        .pushNamed(MyNavigationRoutes.extendedChart, arguments: {
      'chartType': chartType,
      'followables': entities,
    });
  }

  static void pushBookmarks(BuildContext context) {
    Navigator.of(context).pushNamed(MyNavigationRoutes.userFollowing);
  }
}
