import 'package:flutter/material.dart';
import '../../../utils/my_constants.dart';

import '../../../../models/interfaces/data_interfaces.dart';
import 'followable_item.dart';

class FollowableList<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final List<T> followables;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidgetForItems;
  final bool showWeeklyFollowers;
  final double? horizontalPaddingOfItems;

  const FollowableList(
      {Key? key,
      this.startingWidgetForItems,
      required this.followables,
      required this.onItemTap,
      this.onIconTap,
      this.showWeeklyFollowers = false,
      this.horizontalPaddingOfItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: followables.map((entity) {
        return FollowableItem<T>(
          key: ValueKey(entity.id),
          startingWidget: startingWidgetForItems,
          entity: entity,
          onItemTap: onItemTap,
          onIconTap: onIconTap,
          showWeeklyFollowers: showWeeklyFollowers,
          horizontalPadding:
              horizontalPaddingOfItems ?? MyConstants.horizontalPaddingOrMargin,
        );
      }).toList(),
    );
  }
}
