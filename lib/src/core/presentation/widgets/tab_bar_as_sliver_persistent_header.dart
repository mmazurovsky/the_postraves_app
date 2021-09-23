import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import 'event_tab.dart';
import 'my_horizontal_padding.dart';

class TabBarAsSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final bool isScrollable;
  final TabController tabController;
  final List<String> tabNames;

  @override
  // TODO: implement maxExtent
  double get maxExtent => 46.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 46.0;

  TabBarAsSliverPersistentHeader(
      {required this.tabController,
      required this.tabNames,
      required this.isScrollable});

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: MyColors.screenBackground,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: MyColors.forDividers,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
          MyHorizontalPadding(
            child: TabBar(
              isScrollable: isScrollable,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: MyColors.accent,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              labelColor: MyColors.accent,
              unselectedLabelColor: MyColors.main,
              tabs: tabNames
                  .map((tabName) => EventTab(tabName: tabName))
                  .toList(),
              controller: tabController,
            ),
          ),
        ],
      ),
    );
  }
}
