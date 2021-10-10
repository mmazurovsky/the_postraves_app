import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/models/related_to_search/unified_search_model.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import 'followable_list_item.dart';

class FollowableList extends StatelessWidget {
  final List<UnifiedSearchModel> followables;
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
          key: ValueKey(entity.wikiDataDto.id),
          startingWidget: startingWidgetForItems,
          followable: entity,
          onItemTap: onItemTap,
          onIconTap: onIconTap,
        );
      }).toList(),
    );
  }
}
