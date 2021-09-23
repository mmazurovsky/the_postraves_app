import 'package:flutter/material.dart';

import '../navigation_bar/bottom_navigation_tab_item.dart';

class CurrentTabProvider extends ChangeNotifier {
  TabItem _tabItem;
  CurrentTabProvider(this._tabItem);

  TabItem get currentTab => _tabItem;

  void changeCurrentTab(TabItem newTab) {
    _tabItem = newTab;
    notifyListeners();
  }
}
