import 'package:flutter/material.dart';
import '../../../common/data/unified_search_model.dart';
import 'search_unified_model_list_item.dart';

class SearchUnifiedModelList extends StatelessWidget {
  final List<UnifiedSearchModel> followables;
  final Function? onIconTap;
  final Function onItemTap;
  final Widget? startingWidgetForItems;

  const SearchUnifiedModelList({
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
        return SearchUnifiedModelListItem(
          key: ValueKey(entity.followableData.id),
          startingWidget: startingWidgetForItems,
          followable: entity,
          onItemTap: onItemTap,
          onIconTap: onIconTap,
        );
      }).toList(),
    );
  }
}
