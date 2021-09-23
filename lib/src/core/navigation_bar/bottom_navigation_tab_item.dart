import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../my_navigation.dart';

enum TabItem { SHOWS, SEARCH, PROFILE }

extension TabItemExtension on TabItem {
  static const Map<TabItem, String> _tabNameMap = {
    TabItem.SHOWS: 'Афиша',
    TabItem.SEARCH: 'Поиск',
    TabItem.PROFILE: 'Профиль',
  };

  static const _tabInactiveIconMap = {
    TabItem.SHOWS: Ionicons.calendar_clear_outline,
    TabItem.SEARCH: Ionicons.search_outline,
    TabItem.PROFILE: Ionicons.id_card_outline,
  };

  static const _tabActiveIconMap = {
    TabItem.SHOWS: Ionicons.calendar,
    TabItem.SEARCH: Ionicons.search,
    TabItem.PROFILE: Ionicons.id_card,
  };

  static const _tabRoute = {
    TabItem.SHOWS: MyNavigationRoutes.shows,
    TabItem.SEARCH: MyNavigationRoutes.ratings,
    TabItem.PROFILE: MyNavigationRoutes.profileResolver,
  };

  static var _navigatorKeys = {
    TabItem.SHOWS: GlobalKey<NavigatorState>(),
    TabItem.SEARCH: GlobalKey<NavigatorState>(),
    TabItem.PROFILE: GlobalKey<NavigatorState>(),
  };

  static var _scrollControllers = {
    TabItem.SHOWS: ScrollController(),
    TabItem.SEARCH: ScrollController(),
    TabItem.PROFILE: ScrollController(),
  };

  IconData get tabActiveIcon => _tabActiveIconMap[this]!;
  String get tabName => _tabNameMap[this]!;
  IconData get tabInactiveIcon => _tabInactiveIconMap[this]!;
  String get tabNavigatorRoute => _tabRoute[this]!;
  GlobalKey<NavigatorState> get tabNavigatorKey => _navigatorKeys[this]!;
  ScrollController get tabScrollController => _scrollControllers[this]!;
}
