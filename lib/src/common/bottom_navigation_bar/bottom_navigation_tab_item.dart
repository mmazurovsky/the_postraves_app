import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../my_navigation.dart';

enum TabItem { shows, search, profile }

extension TabItemExtension on TabItem {
  static const Map<TabItem, String> _tabNameMap = {
    TabItem.shows: 'Афиша',
    TabItem.search: 'Поиск',
    TabItem.profile: 'Профиль',
  };

  static const _tabInactiveIconMap = {
    TabItem.shows: Ionicons.calendar_clear_outline,
    TabItem.search: Ionicons.search_outline,
    TabItem.profile: Ionicons.id_card_outline,
  };

  static const _tabActiveIconMap = {
    TabItem.shows: Ionicons.calendar,
    TabItem.search: Ionicons.search,
    TabItem.profile: Ionicons.id_card,
  };

  static const _tabRoute = {
    TabItem.shows: MyNavigationRoutes.shows,
    TabItem.search: MyNavigationRoutes.ratings,
    TabItem.profile: MyNavigationRoutes.profileResolver,
  };

  static final _navigatorKeys = {
    TabItem.shows: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  static final _scrollControllers = {
    TabItem.shows: ScrollController(),
    TabItem.search: ScrollController(),
    TabItem.profile: ScrollController(),
  };

  IconData get tabActiveIcon => _tabActiveIconMap[this]!;
  String get tabName => _tabNameMap[this]!;
  IconData get tabInactiveIcon => _tabInactiveIconMap[this]!;
  String get tabNavigatorRoute => _tabRoute[this]!;
  GlobalKey<NavigatorState> get tabNavigatorKey => _navigatorKeys[this]!;
  ScrollController get tabScrollController => _scrollControllers[this]!;
}
