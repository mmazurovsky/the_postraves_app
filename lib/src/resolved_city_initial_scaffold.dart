import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation_bar/bottom_navigation_tab_item.dart';
import 'core/navigation_bar/my_bottom_navigation_bar.dart';
import 'core/provider/current_tab_provider.dart';
import 'core/utils/my_colors.dart';
import 'my_navigation.dart';

class ResolvedCityInitialScaffold extends StatelessWidget {
  const ResolvedCityInitialScaffold({Key? key}) : super(key: key);

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
        index: context.watch<CurrentTabProvider>().currentTab.index,
        children: [
          _buildNavigatorForTab(TabItem.shows),
          // _buildNavigatorForTab(TabItem.SEARCH),
          // _buildNavigatorForTab(TabItem.PROFILE),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
