import 'package:flutter/material.dart';
import '../provider/current_tab_provider.dart';
import '../presentation/widgets/animations/scale_animation_wrapper.dart';
import '../utils/my_colors.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_tab_item.dart';

class MyBottomNavigationBar extends StatefulWidget {
  // final TabItem currentTab;
  // final ValueChanged<TabItem> onSelectTab;

  MyBottomNavigationBar(
      // {required this.currentTab, required this.onSelectTab}
      );

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late bool thereWasTabChange;

  @override
  void initState() {
    super.initState();
    thereWasTabChange = false;
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
      bool isCurrentTab, TabItem thisTabItem) {
    Widget icon = Icon(
      isCurrentTab ? thisTabItem.tabActiveIcon : thisTabItem.tabInactiveIcon,
      size: 30,
      color: isCurrentTab
          ? MyColors.forActiveBottomBarIcons
          : MyColors.forInactiveBottomBarIcons,
    );
    return BottomNavigationBarItem(
      label: thisTabItem.tabName,
      icon: isCurrentTab && thereWasTabChange
          ? ScaleAnimationWrapper(
              child: icon,
            )
          : icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    TabItem currentTab = context.watch<CurrentTabProvider>().currentTab;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.bottomNavBar,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        thereWasTabChange = true;
        context
            .read<CurrentTabProvider>()
            .changeCurrentTab(TabItem.values[index]);
        if (index == currentTab.index) {
          if (currentTab.tabNavigatorKey.currentState!.canPop()) {
            currentTab.tabNavigatorKey.currentState!
                .popUntil(ModalRoute.withName(currentTab.tabNavigatorRoute));
          } else {
            if (currentTab.tabScrollController.hasClients) {
              currentTab.tabScrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 400),
              );
            }
          }
        }
      },
      items: [
        _getBottomNavigationBarItem(currentTab == TabItem.SHOWS, TabItem.SHOWS),
        _getBottomNavigationBarItem(
            currentTab == TabItem.SEARCH, TabItem.SEARCH),
        _getBottomNavigationBarItem(
            currentTab == TabItem.PROFILE, TabItem.PROFILE),
      ],
    );
  }
}
