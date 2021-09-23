import 'package:flutter/material.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import 'followable_list_item.dart';

class FollowableList<T extends SimpleFollowableInterface> extends StatelessWidget {
  final List<T> followables;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidgetForItems;

  const FollowableList({
    Key? key,
    this.startingWidgetForItems,
    required this.followables,
    required this.onItemTap,
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: followables.map((entity) {
        return FollowableListItem(
          key: ValueKey(entity.id),
          startingWidget: startingWidgetForItems,
          followable: entity,
          onItemTap: onItemTap,
          onIconTap: onIconTap,
        );
      }).toList(),
    );
  }
}
