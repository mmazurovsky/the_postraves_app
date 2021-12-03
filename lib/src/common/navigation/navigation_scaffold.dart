import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../geo_change_notifier/current_tab_provider.dart';
import 'my_navigation.dart';

class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({Key? key}) : super(key: key);

  Widget _buildNavigatorForTab(TabItem tabItem) {
    return MyNavigator(
      navigatorKey: tabItem.tabNavigatorKey,
      activeBottomTab: tabItem.tabNavigatorRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      body: IndexedStack(
        index: context.watch<CurrentTabChangeNotifier>().currentTab.index,
        children: [
          _buildNavigatorForTab(TabItem.shows),
          _buildNavigatorForTab(TabItem.search),
          _buildNavigatorForTab(TabItem.profile),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
