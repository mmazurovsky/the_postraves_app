import 'package:flutter/material.dart';
import '../provider/current_tab_provider.dart';
import '../presentation/widgets/animations/scale_animation_wrapper.dart';
import '../utils/my_colors.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_tab_item.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

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
      showUnselectedLabels: false,
      //* https://github.com/flutter/flutter/issues/86545
      selectedFontSize: 0,
      showSelectedLabels: false,
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
        _getBottomNavigationBarItem(currentTab == TabItem.shows, TabItem.shows),
        _getBottomNavigationBarItem(
            currentTab == TabItem.search, TabItem.search),
        _getBottomNavigationBarItem(
            currentTab == TabItem.profile, TabItem.profile),
      ],
    );
  }
}
