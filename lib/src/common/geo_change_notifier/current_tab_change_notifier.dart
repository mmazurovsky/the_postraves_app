import 'package:flutter/material.dart';
import '../bottom_navigation_bar/bottom_navigation_tab_item.dart';


class CurrentTabChangeNotifier extends ChangeNotifier {
  TabItem _tabItem;
  CurrentTabChangeNotifier(this._tabItem);

  TabItem get currentTab => _tabItem;

  void changeCurrentTab(TabItem newTab) {
    _tabItem = newTab;
    notifyListeners();
  }
}
