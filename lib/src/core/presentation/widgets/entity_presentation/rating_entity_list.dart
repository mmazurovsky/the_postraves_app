import 'package:flutter/material.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import 'rating_entity_list_item.dart';

class RatingEntityList<T extends FollowableInterface> extends StatelessWidget {
  final List<T> entityList;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidgetForItems;

  const RatingEntityList({
    Key? key,
    this.startingWidgetForItems,
    required this.entityList,
    required this.onItemTap,
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: entityList.map((entity) {
        return RatingEntityListItem<T>(
          key: ValueKey(entity.id),
          startingWidget: startingWidgetForItems,
          entity: entity,
          onItemTap: onItemTap,
          onIconTap: onIconTap,
        );
      }).toList(),
    );
  }
}
