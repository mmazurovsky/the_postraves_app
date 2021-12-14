import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_app/src/common/widgets/animations/wrappers.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../geo_change_notifier/current_tab_change_notifier.dart';
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
    TabItem currentTab = context.watch<CurrentTabChangeNotifier>().currentTab;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.bottomNavBar,
      showUnselectedLabels: false,
      //* https://github.com/flutter/flutter/issues/86545
      selectedFontSize: 0,
      showSelectedLabels: false,
      onTap: (tappedTabIndex) {
        // cases when tapped on active tab bar item
        if (tappedTabIndex == currentTab.index) {
          // case when navigation stack not empty
          if (currentTab.tabNavigatorKey.currentState!.canPop()) {
            currentTab.tabNavigatorKey.currentState!
                .popUntil(ModalRoute.withName(currentTab.tabNavigatorRoute));
          }
          // case when navigation stack empty
          else {
            if (currentTab.tabScrollController.hasClients) {
              currentTab.tabScrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 400),
              );
            }
          }
        } else {
          thereWasTabChange = true;
          context
              .read<CurrentTabChangeNotifier>()
              .changeCurrentTab(TabItem.values[tappedTabIndex]);
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
