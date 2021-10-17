import 'package:flutter/material.dart';
import 'package:the_postraves_app/src/models/related_to_search/unified_search_model.dart';
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
